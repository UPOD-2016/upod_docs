# Categories have many subcategories. These categories and Subcategories are
# the organization of all the articles. Articles are sorted under categories
# and subcategories.
# @see Subcategory
#
# == Schema Information
#
# Table name: categories
#
#  name        :string(255)           primary key
#   - represents the name of the category
#
#  description :string(255)
#   - represents the description of the category
#
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'carrierwave'
class Category < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_save { self.name = (name.downcase).titleize }
  validates :name, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: false }
  has_many :subcategories
end
