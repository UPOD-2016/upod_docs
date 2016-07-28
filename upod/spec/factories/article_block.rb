# == Schema Information
#
# Table name: article_blocks
#
#  id           :integer          not null, primary key
#  position     :integer
#  article_id   :integer
#  actable_id   :integer          not null
#  actable_type :string(255)
#

FactoryGirl.define do
	factory :article_block, class: ArticleTextBlock do
		article
	end

	factory :text_block, parent: :article_block, class: ArticleTextBlock  do
		body "this is a text block body"
	end
end

