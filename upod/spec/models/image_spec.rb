require 'rails_helper'

RSpec.describe Image, type: :model do

  it { is_expected.to validate_presence_of(:body) }

  it do
  should have_many :article_image_blocks
  end

end
