require 'rails_helper'

RSpec.describe ArticleDiagramBlock, type: :model do

    it { should belong_to(:diagram) }
    it { is_expected.to act_as(:article_block) }

end
