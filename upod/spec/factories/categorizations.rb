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

FactoryGirl.define do
  factory :categorization do
    article_id 1
    subcategory_id 1
  end
end
