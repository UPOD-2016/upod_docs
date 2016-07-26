#
# author: Michael Roher, Kieran O'Driscoll, Steven Swartz
#
require 'rails_helper'

RSpec.describe EquationBlockVariable, type: :model do

  it { is_expected.to validate_presence_of(:variable) }
  it { is_expected.to validate_presence_of(:description) }


  it do
    should validate_length_of(:description).
      is_at_most(255).
      on(:create)
  end
end
