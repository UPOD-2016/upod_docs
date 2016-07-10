# A contributor is a user who has edited an article. A contributor has a one-to-one connection
# to {User} and has a many-to-many connection with {Article}.
# @see User
#
# == Schema Information
#
# Table name: contributors
#
#  user_id          :integer(4)          primary key
#   - represents the contributors user id
#
#  artcle_id        :integer(4)
#   - represents the articles associated with the contiburtor
#
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
end
