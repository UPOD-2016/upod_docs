# == Schema Information
#
# Table name: constants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  value       :decimal(10, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Constant < ActiveRecord::Base
  has_many :article_constant_blocks
end
