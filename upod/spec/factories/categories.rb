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

FactoryGirl.define do
  factory :category do
    name "MyString"
  end
end
