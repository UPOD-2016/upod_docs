# == Schema Information
#
# Table name: contributors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :contributor do
    user_id 1
    article_id 1
  end
end
