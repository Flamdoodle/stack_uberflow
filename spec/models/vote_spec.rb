require 'rails_helper'

describe Vote do
  it {should have_one(:answer)}
end
