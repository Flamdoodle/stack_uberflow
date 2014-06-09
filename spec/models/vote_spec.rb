require_relative '../spec_helper'

describe Vote do
  it {should have_one(:answer)}
end
