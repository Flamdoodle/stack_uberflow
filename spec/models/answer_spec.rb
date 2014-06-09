<<<<<<< HEAD
require '../spec_helper'
=======
require_relative '../spec_helper'
>>>>>>> dfb246155614f10a14c2b8d7fb38baed9c6dbf77

describe Answer do
  context "associations" do
    it {should have_many(:votes)}
    it {should belong_to(:answerer)}
    it {should_not belong_to(:asker)}
    it {should_not belong_to(:user)}
    it {should belong_to(:question)}
  end

  context "creating an answer" do
    it "creates an answer when there is a body" do
      answer = Answer.new(
        body: 'Just curious'
        )
      expect(answer).to be_valid
    end
  end
end


