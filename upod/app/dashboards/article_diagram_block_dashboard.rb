require "administrate/base_dashboard"

class ArticleDiagramBlockDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    actable: Field::Polymorphic,
    article: Field::BelongsTo,
    diagram: Field::BelongsTo,
    article_block: Field::HasOne,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :diagram,
    :actable,
    :article,
    :article_block,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :article,
    :diagram,
    :article_block,
    :actable,
    #:created_at,
    #:updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    #:actable,
    :article,
    :diagram,
    #:article_block,
  ].freeze

  # Overwrite this method to customize how article diagram blocks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article_diagram_block)
  #   "ArticleDiagramBlock ##{article_diagram_block.id}"
  # end
end
