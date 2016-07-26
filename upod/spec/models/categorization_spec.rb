# author: Kieran O'Driscoll
#
# == Schema Information
#
# Table name: categorizations
#
#  id             :integer          not null, primary key
#  article_id     :integer
#  subcategory_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Categorization, type: :model do

end
