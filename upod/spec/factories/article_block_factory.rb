FactoryGirl.define do
	factory :article_block, class: ArticleTextBlock do
		article
	end
	
	factory :text_block, parent: :article_block, class: ArticleTextBlock  do
		body "this is a text block body"
	end
end

