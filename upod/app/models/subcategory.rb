# SubCategories have a one-to-one connection with a category. Categories can have
# multiple subcategories. Articles fall under subcategories and categories for ease
# of searching for them and better organization of the articles.
# @see Category
#
# author: Kieran O'Driscoll (Validations)
#
# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :categorizations,  :dependent => :nullify
  has_many :articles, :through => :categorizations

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    new_record?
  end

  validates :name, presence: true, length: {maximum: 255}
  validates :description, length: {maximum: 65535}
  validates :category_id, presence: true

end
