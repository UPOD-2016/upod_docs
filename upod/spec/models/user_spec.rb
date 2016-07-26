# author: Kieran O'Driscoll

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:encrypted_passoword) }

  it do
    should validate_length_of(:email).
      is_at_most(255).
      on(:create)
  end

  it do
    should validate_length_of(:encrypted_password).
      is_at_most(255).
      on(:create)
  end
end
