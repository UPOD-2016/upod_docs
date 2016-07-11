require 'rails_helper'

RSpec.describe ArticleImageBlock, type: :model do
  it { is_expected.to act_as(:article_block) }
  it { should belong_to(:image) }
end
