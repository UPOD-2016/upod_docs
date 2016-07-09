class Category < ActiveRecord::Base
  before_save { self.name = (name.downcase).titleize }
  validates :name, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: false }
end
