# User contains the information related to moderators and admins. It utilizes
# LDAP to gather information from Laurier's AD. Laurier's AD hanldes the authentication
# User's has many contributions
# @see Contributor
#
# == Schema Information
#
# Table name: users
#
#  email                      :string(255)          not null, primary key
#   - represents the user's email
#
#  encrypted_password         :string(255)          not null, primary key
#   - represents the user's encrypted password
#
#  reset_password_token       :string(255)
#   - represents the user's reset password toekn
#
#  reset_password_sent_at     :datetime
#   - represents the time when the reset password token was sent
#
#  sign_in_count              :integer(4)       not null
#   - represents the # of times the user has signe din
#
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  remember_created_at        :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class User < ActiveRecord::Base
  has_many :contributions, class_name: 'Contributor', foreign_key: :user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # @todo document method
  def ldap_before_save
   self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
  end
end
