# author: Kieran O'Driscoll(Organization and overriding methods)

require "administrate/base_dashboard"

class ArticleEquationBlockDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    actable: Field::Polymorphic,
    article: Field::BelongsTo,
    article_block: Field::HasOne,
    equation_block_variables: Field::HasMany,
    id: Field::Number,
    equation: Field::Text,
    label: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :equation,
    :label,
    :equation_block_variables,
    #:actable,
    :article,
    :article_block,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :equation,
    :label,
    :equation_block_variables,
    :article,
    #:actable,
    :article_block,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    #:actable,
    #:article,
    #:article_block,
    :equation,
    :label,
  ].freeze

  # Overwrite this method to customize how article equation blocks are displayed
  # across all pages of the admin dashboard.
  #
end
