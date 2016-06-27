require 'rails_helper'

RSpec.describe ArticleBlock, type: :model do
  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_uniqueness_of(:position) }
  it { is_expected.to validate_presence_of(:actable_id) }
  it { is_expected.to validate_presence_of(:actable_type) }

  it do
    should validate_length_of(:actable_type).
      is_at_most(255).
      on(:create)
  end

end
