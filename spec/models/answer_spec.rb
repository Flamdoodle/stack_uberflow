require_relative '../spec_helper'

describe Answer do
  it {should have_many(:votes)}
  it {should belong_to(:answerer)}
  it {should_not belong_to(:asker)}
  it {should_not belong_to(:user)}
  it {should belong_to(:question)}
end

