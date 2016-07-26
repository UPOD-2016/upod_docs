#
# author: Mike Roheer, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Subcategory, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { should belong_to(:category) }

  it do
    should validate_length_of(:description).
      is_at_most(65535).
      on(:create)
  end

  it do
    should validate_length_of(:name).
      is_at_most(255).
      on(:create)
  end

end
