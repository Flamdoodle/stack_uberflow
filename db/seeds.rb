# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

payam = User.create(username: "Payam", password: "hello")
nirav = User.create(username: "Nirav", password: "hello")

@rails = payam.questions.create(title: "What is rails?", body: "is it godly?")
nirav.answers.create(question_id: @rails.id, body: "yes, payam..it is godly")