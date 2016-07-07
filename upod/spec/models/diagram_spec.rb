require 'rails_helper'

RSpec.describe Diagram, type: :model do

# uses rspec to check that Diagram has many article_diagram_blocks
  it do
	   should have_many :article_diagram_blocks
  end

end
