require 'rails_helper'

RSpec.describe Constant, type: :model do

# Uses shoulda matcher as well as RSpec to validate the presence of name,
# description, value. Also test the uniqueness of the name in a Constant
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_uniqueness_of(:name) }


# Uses shoulda matcher as well as RSpec to validate and test the length of
# the name in a Constant
  it do
    should validate_length_of(:name).
      is_at_most(255).
      on(:create)
  end

# Uses shoulda matcher as well as RSpec to validate and test the length of
# the description in a Constant
  it do
    should validate_length_of(:description).
      is_at_most(65535).
      on(:create)
  end
end
