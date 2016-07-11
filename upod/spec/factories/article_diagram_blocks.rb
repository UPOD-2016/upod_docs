# == Schema Information
#
# Table name: article_diagram_blocks
#
#  id         :integer          not null, primary key
#  diagram_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :article_diagram_block do
    diagram_id 1
  end
end
