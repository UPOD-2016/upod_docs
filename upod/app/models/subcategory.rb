# SubCategories have a one-to-one connection with a category. Categories can have
# multiple subcategories. Articles fall under subcategories and categories for ease
# of searching for them and better organization of the articles.
# @see Category
#
# == Schema Information
#
# Table name: subcategories
#
#  name        :string(255)      primary key
#   - represents the name of the subcategory
#
#  description :text(65535)
#   - represents the description of the subcategory
#
# category_id  :integer(4)
#   - represents the id of the category that the subcategory belongs to.
#
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :categorizations
  has_many :articles, :through => :categorizations

  validates :name, presence: true, length: {maximum: 255}
  validates :description, length: {maximum: 65535}
  validates :category_id, presence: true

end
