# User contains the information related to moderators and admins. It utilizes
# LDAP to gather information from Laurier's AD. Laurier's AD hanldes the authentication
# User's has many contributions
# @see Contributor
#
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  has_many :contributions, class_name: 'Contributor', foreign_key: :user_id
  devise :registerable,:recoverable, :rememberable, :trackable, :validatable
  # @todo document method
end
