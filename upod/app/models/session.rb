# Sessions contains the data related to any active sessions of the site.
# It contains the session ID and any required data.
#
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

class Session < ActiveRecord::Base

  validates :session_id, presence: true
  validates :data,  length: {maximum: 65535}


end
