class Comment < ActiveRecord::Base
  attr_accessible :body, :user, :question, :answer, :commentable_type, :commentable_id

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :body, presence: true
  validates :user, presence: true

  # Add validation to make sure EITHER answer OR question is present
end
