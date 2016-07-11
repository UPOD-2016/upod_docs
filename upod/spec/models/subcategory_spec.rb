require 'rails_helper'

RSpec.describe Subcategory, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { should belong_to(:category) }

  it do
    should validate_length_of(:description).
      is_at_most(65535).
      on(:create)
  end

  it do
    should validate_length_of(:name).
      is_at_most(255).
      on(:create)
  end

end
