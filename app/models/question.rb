class Question < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :asker, class_name: "User"
  has_many :votes, :as => :voteable
end
