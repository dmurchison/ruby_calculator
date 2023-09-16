# frozen_string_literal: true

require_relative '../classes/calc' # First I need to load the class/file I want to test

RSpec.describe Calculator do # I'm describing the Calculator class (from calc.rb)
  let(:calc) { Calculator.new } # This is a helper method that will create a new instance of the Calculator class

  it 'exists' do
    expect(calc).to be_a(Calculator)
  end

  it 'can add the same two numbers' do
    calc.evaluate_add('2 + 2')
    expect(calc.result).to eq(4)
  end

  it 'can add two different numbers' do
    calc.evaluate_add('4 + 5')
    expect(calc.result).to eq(9)
  end

  it 'can subtract the same two numbers' do
    calc.evaluate_subtract('5 - 2')
    expect(calc.result).to eq(3)
  end
end
