class User < ActiveRecord::Base
  attr_accessible :username, :password, :question, :answer, :comment

  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "answerer_id"

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :username, uniqueness: true

  has_secure_password


end
