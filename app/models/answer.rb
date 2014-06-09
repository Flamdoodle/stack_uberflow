class Answer < ActiveRecord::Base
  attr_accessible :body, :question, :question_id, :user, :answerer, :answerer_id, :comment, :best

  belongs_to :answerer, class_name: "User"
  belongs_to :question

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
