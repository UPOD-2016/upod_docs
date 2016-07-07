require 'rails_helper'

RSpec.describe User, type: :model do

    it do
	     should have_many :contributions
     end


end
