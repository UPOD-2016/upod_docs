require 'rails_helper'

RSpec.describe ArticleTextBlock, type: :model do
  it { is_expected.to validate_presence_of(:body) }

  it do
    should validate_length_of(:body).
      is_at_most(65535).
      on(:create)
  end
end
