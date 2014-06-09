require_relative "../spec_helper"

describe Comment do
  context "create new comment" do
    it "is valid if it has a body" do
      comment = Comment.new(body: "woot", user_id: 1)
      expect(comment).to be_valid
    end

    it "is invalid if it does not have a body" do
      comment = Comment.new(user_id: 1)
      expect(comment).to_not be_valid
    end
  end

end