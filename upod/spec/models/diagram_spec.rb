require 'rails_helper'

RSpec.describe Diagram, type: :model do

  it do
	   should have_many :article_diagram_blocks
  end

end
