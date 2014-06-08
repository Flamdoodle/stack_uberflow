class User < ActiveRecord::Base
  attr_accessible :username, :password_digest, :question, :answer 
  has_secure_password

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true

  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "answerer_id"
  has_many :votes, as: :voteable

end
