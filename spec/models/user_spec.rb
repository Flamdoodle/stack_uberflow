require_relative '../spec_helper'

describe User do
  it {should have_many(:questions)}
  it {should have_many(:answers)}
  it {should have_many(:votes)}

  context "create new user" do
    it "doesn't create a new user if missing a username" do
      expect(User.new(password: "test")).to_not be_valid 
    end

    it "doesn't create a new user if missing a password" do
      expect(User.new(username: "test")).to_not be_valid
    end

    it "doesn't create a new user if the username is taken" do
      User.create(username: "testuser", password: "test")
      expect(User.create(username: "testuser", password: "test1")).to_not be_valid
    end

    it "creates a new user if valid" do
      expect(User.create(username: "valid", password: "test")).to be_valid
    end    
  end

  
end


