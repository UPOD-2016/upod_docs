class Category < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_save { self.name = (name.downcase).titleize }
  validates :name, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: false }
  has_many :subcategories
end
