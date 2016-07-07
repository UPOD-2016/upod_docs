require 'rails_helper'

RSpec.describe ArticleDiagramBlock, type: :model do

# tests whether ArticleDiagramBlock belongs to diagram and if it acts
# as an article_block
    it { should belong_to(:diagram) }
    it { is_expected.to act_as(:article_block) }

end
