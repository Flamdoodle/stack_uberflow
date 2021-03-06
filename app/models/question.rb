class Question < ActiveRecord::Base
  attr_accessible :title, :body, :answer, :user, :asker, :asker_id, :comment

  belongs_to :asker, class_name: "User"

  has_many :answers

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, presence: true
end
