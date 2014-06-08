require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

payam = User.create(username: "Payam", password: "hello")
nirav = User.create(username: "Nirav", password: "hello")
insung = User.create(username: "insung", password: "hello")

@rails = payam.questions.create(title: "What is rails?", body: "is it godly?")
nirav.answers.create(question_id: @rails.id, body: "yes, payam..it is godly")
insung.answers.create(question_id: @rails.id, body: "oh yes, es berry berry naaaice")

# 20.times do
#   User.create(username: Faker::Name.name, password: "hello")
# end

# @users = User.all

# @users.each do |user|
#   # 20.times do
#     Question.create(asker_id: user.id, title: Faker::Lorem.word, body: Faker::Lorem.sentence)
#   # end
# end
