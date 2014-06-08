class Comment < ActiveRecord::Base
  attr_accessible :body, :user, :commenter, :answer, :question
  belongs_to :commenter, class_name: "User"
  belongs_to :answer
  belongs_to :question
  has_many :votes, as: :voteable

  validates :body, presence: true
  validates :commenter, presence: true

  # Add validation to make sure EITHER answer OR question is present
end
