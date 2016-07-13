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

require 'rails_helper'

RSpec.describe Session, type: :model do

  it { is_expected.to validate_presence_of(:session_id) }

  it do
    should validate_length_of(:data).
      is_at_most(65535).
      on(:create)
  end

end
