require 'spec_helper'
require_relative '../spec_helper.rb'

describe Question do 
	it "should create a title and body in the question" do
		question = Question.new(
			title: 'What is rails?'
			body: 'Just curious',
			)
	end

	it "should create a question even without a title" do
			question = Question.new(
				title: nil,
				body: 'Just curious',
				)
		end
end