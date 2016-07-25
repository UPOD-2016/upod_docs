# Categories have many subcategories. These categories and Subcategories are
# the organization of all the articles. Articles are sorted under categories
# and subcategories. When editor attempts to remove a category, the subcategory
# record will be set to NULL instead of actual deletion. This is to prevent
# subcategories and articles to be mass deleted.
# @see Subcategory
#
# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  image       :string(255)
#

class Category < ActiveRecord::Base
  mount_uploader :image, CategoryImageUploader
  before_save { self.name = (name.downcase).titleize }
  validates :name, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: false }
  has_many :subcategories, :dependent => :nullify
  after_commit :reindex_category

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
  new_record?
  end

  def reindex_category
    Article.reindex # or reindex_async
  end
end
