require 'rails_helper'

RSpec.describe Category, type: :model do

  it { is_expected.to validate_presence_of(:name) }

  it do
    should validate_length_of(:name).
      is_at_most(255).
      on(:create)
  end

  it do
  should have_many :subcategories
  end

end
