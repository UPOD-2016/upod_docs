# == Schema Information
#
# Table name: article_blocks
#
#  id           :integer          not null, primary key
#  position     :integer
#  article_id   :integer
#  actable_id   :integer
#  actable_type :string(255)
#

class ArticleBlock < ActiveRecord::Base
  actable
  belongs_to :article
  # The scope restricts it to the article id
  acts_as_list scope: :article_id

  # Used to resolve partials in views
  # e.g. ArticleTextBlock => text_block
  def slug
    self.specific.class.to_s.underscore.split('article_').last
  end


end
