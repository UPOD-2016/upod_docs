class User < ActiveRecord::Base
  has_many :contributions, class_name: 'Contributor', foreign_key: :user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def ldap_before_save
   self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
  end
end
