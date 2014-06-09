class Vote < ActiveRecord::Base
  attr_accessible :vote_value, :user, :voteable_type, :voteable_id

  belongs_to :voteable, polymorphic: true

  belongs_to :user
end
