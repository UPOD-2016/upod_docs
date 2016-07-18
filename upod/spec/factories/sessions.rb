# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  session_id :string(255)      not null
#  data       :text(65535)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :session do
    
  end
end
