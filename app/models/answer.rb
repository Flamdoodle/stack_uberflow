class Answer < ActiveRecord::Base
  attr_accessible :body
  belongs_to :answerer, class_name: "User"
  belongs_to :question
  has_many :votes, :as => :voteable
end
