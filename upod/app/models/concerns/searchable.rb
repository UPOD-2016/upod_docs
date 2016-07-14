#
#  Using searchkick now so this file is no longer needed.   However,
#  it should demonstrate how it will be set up once everything is configured
#
#

require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern
  included do
    include Elasticsearch::Model
    # Customize the index name
    #
    index_name [Rails.application.engine_name, Rails.env].join('_')
    # Set up index configuration and mapping
    #
    settings index: { number_of_shards: 1, number_of_replicas: 0 } do
      mapping do
        indexes :title
        indexes :created_on, type: 'date'
        indexes :contributions do
          indexes :user, type: 'multi_field' do
            indexes :user
            indexes :raw, analyzer: 'keyword'
          end
        end
        indexes :categorizations, analyzer: 'keyword'
        indexes :subcategories
        indexes :article_text_blocks, type: 'nested' do
          indexes :body, analyzer: 'snowball'
          indexes :user, analyzer: 'keyword'
        end
      end
    end
    # Set up callbacks for updating the index on model changes
    #
    after_commit lambda { Indexer.perform_async(:index,  self.class.to_s, self.id) }, on: :create
    after_commit lambda { Indexer.perform_async(:update, self.class.to_s, self.id) }, on: :update
    after_commit lambda { Indexer.perform_async(:delete, self.class.to_s, self.id) }, on: :destroy
    after_touch  lambda { Indexer.perform_async(:update, self.class.to_s, self.id) }
    # Customize the JSON serialization for Elasticsearch
    #
    def as_indexed_json(options={})
      hash = self.as_json(
        include: { contributors:    { methods: [:user], only: [:user] }
                   #eg
                   #comments:   { only: [:body, :stars, :pick, :user, :user_location] }
                 })
      hash['categories'] = self.categories.map(&:title)
      hash
    end
    # Search in title and content fields for `query`, include highlights in response
    #
    # @param query [String] The user query
    # @return [Elasticsearch::Model::Response::Response]
    #
    def self.search(query, options={})
      # Prefill and set the filters (top-level `filter` and `facet_filter` elements)
      #
      __set_filters = lambda do |key, f|
        @search_definition[:filter][:and] ||= []
        @search_definition[:filter][:and]  |= [f]
        @search_definition[:facets][key.to_sym][:facet_filter][:and] ||= []
        @search_definition[:facets][key.to_sym][:facet_filter][:and]  |= [f]
      end
      @search_definition = {
        query: {},
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            title:    { number_of_fragments: 0 },
            abstract: { number_of_fragments: 0 },
            content:  { fragment_size: 50 }
          }
        },
        filter: {},
        facets: {
          categories: {
            terms: {
              field: 'categories'
            },
            facet_filter: {}
          },
          contributors: {
            terms: {
              field: 'contributors.user'
            },
            facet_filter: {}
          },
          created: {
            date_histogram: {
              field: 'created_on',
              interval: 'week'
            },
            facet_filter: {}
          }
        }
      }
      unless query.blank?
        @search_definition[:query] = {
          bool: {
            should: [
              { multi_match: {
                  query: query,
                  fields: ['title^10', 'abstract^2', 'content'],
                  operator: 'and'
                }
              }
            ]
          }
        }
      else
        @search_definition[:query] = { match_all: {} }
        @search_definition[:sort]  = { created_on: 'desc' }
      end
      if options[:category]
        f = { term: { categories: options[:category] } }
        __set_filters.(:contributors, f)
        __set_filters.(:created, f)
      end
      if options[:contributor]
        f = { term: { 'contributors.user' => options[:contributor] } }
        __set_filters.(:categories, f)
        __set_filters.(:created, f)
      end
      if options[:created_week]
        f = {
          range: {
            created_on: {
              gte: options[:created_week],
              lte: "#{options[:created_week]}||+1w"
            }
          }
        }
        __set_filters.(:categories, f)
        __set_filters.(:contributors, f)
      end
      if query.present? && options[:comments]
        @search_definition[:query][:bool][:should] ||= []
        @search_definition[:query][:bool][:should] << {
          nested: {
            path: 'comments',
            query: {
              multi_match: {
                query: query,
                fields: ['body'],
                operator: 'and'
              }
            }
          }
        }
        @search_definition[:highlight][:fields].update 'comments.body' => { fragment_size: 50 }
      end
      if options[:sort]
        @search_definition[:sort]  = { options[:sort] => 'desc' }
        @search_definition[:track_scores] = true
      end
      unless query.blank?
        @search_definition[:suggest] = {
          text: query,
          suggest_title: {
            term: {
              field: 'title.tokenized',
              suggest_mode: 'always'
            }
          },
          suggest_body: {
            term: {
              field: 'content.tokenized',
              suggest_mode: 'always'
            }
          }
        }
      end
      __elasticsearch__.search(@search_definition)
    end
  end
end
