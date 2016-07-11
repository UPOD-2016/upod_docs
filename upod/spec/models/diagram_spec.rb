require 'rails_helper'

RSpec.describe Diagram, type: :model do

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:label) }

# uses rspec to check that Diagram has many article_diagram_blocks
  it do
	   should have_many :article_diagram_blocks
  end


  it do
    should validate_length_of(:body).
      is_at_most(65535).
      on(:create)
  end

  it do
    should validate_length_of(:label).
      is_at_most(255).
      on(:create)
  end

end
