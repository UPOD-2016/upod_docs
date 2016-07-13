# Categorizations hold the relations between articles and their subcategories.
# It contains a list of articles and the subcategories those articles
# fall under.
# @see Article
# @see Subcategory
#
# == Schema Information
#
# Table name: categorizations
#
#  id             :integer          not null, primary key
#  article_id     :integer
#  subcategory_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Categorization < ActiveRecord::Base
	belongs_to :article
	belongs_to :subcategory
end
