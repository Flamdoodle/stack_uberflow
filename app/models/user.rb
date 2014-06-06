class User < ActiveRecord::Base
  attr_accessible :username, :password
  has_secure_password

  validates :username, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :votes

end
