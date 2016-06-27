require 'rails_helper'

RSpec.describe ArticleEquationBlock, type: :model do

  it { is_expected.to validate_presence_of(:equation) }
  it { is_expected.to validate_presence_of(:description) }

  it do
    should validate_length_of(:equation).
      is_at_most(255).
      on(:create)
  end

  it do
    should validate_length_of(:description).
      is_at_most(255).
      on(:create)
  end


end
