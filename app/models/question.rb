class Question < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :asker, class_name: "User"
  # , foreign_key: "asker_id"
  has_many :votes, :as => :voteable
  has_many :answers
end
