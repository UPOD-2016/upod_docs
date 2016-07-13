# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
	factory :article do
		title "This is a test article"
	end
end
