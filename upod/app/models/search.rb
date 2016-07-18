######
#
# This class holds converstion rates.  This means if a user searches for
# Electricity and clicks electromagnetism first then this should push it closer
# to the top of the results list.
#
######

class Search < ActiveRecord::Base
    belongs_to :article

end
