require 'rails_helper'

RSpec.describe Contributor, type: :model do

# uses rspec and shouldamatcher to check if Contributor belongs to user and article
    it { should belong_to(:user) }
    it { should belong_to(:article) }


end
