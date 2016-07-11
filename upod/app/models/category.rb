# Categories have many subcategories. These categories and Subcategories are
# the organization of all the articles. Articles are sorted under categories
# and subcategories.
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
  mount_uploader :image, ImageUploader
  before_save { self.name = (name.downcase).titleize }
  validates :name, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: false }
  has_many :subcategories
end
