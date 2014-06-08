class Question < ActiveRecord::Base
  attr_accessible :title, :body, :answer, :user, :asker
  belongs_to :asker, class_name: "User"
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, presence: true
end
