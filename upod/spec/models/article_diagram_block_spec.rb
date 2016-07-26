#
# author: Michael Roher, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: article_diagram_blocks
#
#  id         :integer          not null, primary key
#  diagram_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ArticleDiagramBlock, type: :model do

# tests whether ArticleDiagramBlock belongs to diagram and if it acts
# as an article_block
    it { should belong_to(:diagram) }
    it { is_expected.to act_as(:article_block) }

end
