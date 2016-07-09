require 'rails_helper'

RSpec.describe User, type: :model do

# uses rspec to check that user has many contributions
    it do
	     should have_many :contributions
     end


end
