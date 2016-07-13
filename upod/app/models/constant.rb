# A constant is a non-changing value. In physics, for example, gravity
# is definited as 9.8m/s^2. Each constant can be reused and therefore
# each constant can have many {ArticleConstantBlock}. Each constant has an id, name, description and value
# @see ArticleConstantBlock
#
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

# validates name's presence, uniqueness and length
# validates description's presence and length
# validates value's presence
  validates :name, presence: true, uniqueness: true, length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 65535}
  validates :value, presence: true



end
