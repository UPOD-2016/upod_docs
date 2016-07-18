require "administrate/base_dashboard"

class ArticleConstantBlockDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    actable: Field::Polymorphic,
    article: Field::BelongsTo,
    constant: Field::BelongsTo,
    article_block: Field::HasOne,
    id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :constant,
    :article,
    #:actable,
    :article_block,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :constant,
    :article,
    #:actable,
    :article_block,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :constant,
    #:actable,
    :article,
    #:article_block,
  ].freeze

  # Overwrite this method to customize how article constant blocks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article_constant_block)
  #   "ArticleConstantBlock ##{article_constant_block.id}"
  # end
end
