# == Schema Information
#
# Table name: article_image_blocks
#
#  id         :integer          not null, primary key
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :article_image_block do
    image_id 1
  end
end
