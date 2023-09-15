# frozen_string_literal: true

require_relative '../classes/calc' # First I need to load the class/file I want to test

RSpec.describe Calculator do # I'm describing the Calculator class (from calc.rb)
  let(:c) { Calculator.new }
  # This is a shortcut to create a new instance of the Calculator class and
  # assign it to the variable c (let is a RSpec keyword)

  it 'exists' do
    c = Calculator.new
    expect(c).to be_a(Calculator)
  end

  it 'can add two numbers' do
    c = Calculator.new
    c.evaluate('2 + 3')
    expect(c.result).to eq(5)
  end

  it 'can add two different numbers' do
    c = Calculator.new
    c.evaluate('4 + 5')
    expect(c.result).to eq(9)
  end
end
