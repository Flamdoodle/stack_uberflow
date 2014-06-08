# require 'spec_helper'
require '../spec_helper'

describe Question do 
	
	it "should create a title and body in the question" do
		question = Question.new(
			title: 'What is rails?',
			body: 'Just curious',
			)
		expect(question).to be_valid
	end

	it "should create a question even without a title" do
			question = Question.new(
				title: nil,
				body: 'Just curious',
				)
			expect(question).to be_invalid
	end

	it "every title must be longer than 2 characters" do
		question = Question.new(
				title: "a",
				body: 'Just curious',
				)
		expect(question).to be_invalid
	end


end