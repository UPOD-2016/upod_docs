require 'rails_helper'

RSpec.describe Session, type: :model do

  it { is_expected.to validate_presence_of(:session_id) }

  it do
    should validate_length_of(:data).
      is_at_most(65535).
      on(:create)
  end

end
