#
# author: Mike Roheer, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#  image       :string(255)
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  it { is_expected.to validate_presence_of(:name) }

  it do
    should validate_length_of(:name).
      is_at_most(255).
      on(:create)
  end

  it do
  should have_many :subcategories
  end

end
