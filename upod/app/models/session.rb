# Sessions contains the data related to any active sessions of the site.
# It contains the session ID and any required data.
#
# == Schema Information
#
# Table name: sessions
#
#  session_id         :integer(4)       not null, primary key
#   - represents the diagram id of the associated with the block
#
#  data                :text(65535)
#   - represents the session data
#
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Session < ActiveRecord::Base
end
