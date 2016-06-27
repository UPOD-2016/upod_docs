require 'rails_helper'

RSpec.describe ArticleConstantBlock, type: :model do
  it { is_expected.to validate_presence_of(:constant_id) }
  it { is_expected.to validate_presence_of(:id) }
  it { is_expected.to validate_uniqueness_of(:id) }
end
