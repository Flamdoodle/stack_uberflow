require 'rails_helper'


describe Question do
  it {should have_many(:votes)}
  it {should belong_to(:asker)}
  it {should_not belong_to(:answerer)}
  it {should_not belong_to(:user)}
  it {should have_many(:answers)}
end
