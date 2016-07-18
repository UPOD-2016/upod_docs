# == Schema Information
#
# Table name: diagrams
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  label      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :diagram do
    body "MyText"
    label "MyString"
  end
end
