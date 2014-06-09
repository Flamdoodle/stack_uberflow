# require 'spec_helper'
require_relative '../spec_helper'

describe Question do 
	context "question creation" do
		it "creates a question when there is a title and a body" do
			question = Question.new(
				title: 'What is rails?',
				body: 'Just curious',
				)
			expect(question).to be_valid
		end

		it "doesn't create a question without a title" do
				question = Question.new(
					title: nil,
					body: 'Just curious',
					)
				expect(question).to be_invalid
		end

		it "doesn't create a question if the title is one character" do
			question = Question.new(
					title: "a",
					body: 'Just curious',
					)
			expect(question).to be_invalid
		end
		
		it "requires a question to have a body" do
			question = Question.new(
				title: "invalid",
				body: nil,
				)
			expect(question).to be_invalid
		end
	end
end