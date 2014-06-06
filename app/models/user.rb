class User < ActiveRecord::Base
  attr_accessible :username, :password
  has_secure_password

  validates :username, uniqueness: true

  has_many :questions, foreign_key: "asker_id"
  has_many :answers, foreign_key: "answerer_id"
  has_many :votes

end
