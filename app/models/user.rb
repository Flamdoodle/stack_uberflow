class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :votes

end