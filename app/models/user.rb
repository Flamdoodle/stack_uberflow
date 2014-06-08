class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :username, :password_digest, :question, :answer 
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
=======
  attr_accessible :username, :password, :question, :answer, :comment
>>>>>>> 9d3edf39a0a392bb2b9444735621f029b3a775dc

  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "answerer_id"

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :username, uniqueness: true

  has_secure_password
end
