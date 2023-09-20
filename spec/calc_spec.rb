# frozen_string_literal: true

require_relative '../classes/calc' # First I need to load the class/file I want to test

RSpec.describe Calculator do # I'm describing the Calculator class (from calc.rb)
  let(:calc) { Calculator.new } # This is a helper method that will create a new instance of the Calculator class

  it 'exists' do
    expect(calc).to be_a(Calculator)
  end

  it 'can add the same two numbers' do
    calc.evaluate('2 + 2')
    expect(calc.result).to eq(4)
  end

  it 'can add two different numbers' do
    # This is a different test yes very similar to the one above
    calc.evaluate('4 + 5')
    expect(calc.result).to eq(9)
  end

  it 'can subtract two of the same numbers' do
    calc.evaluate('5 - 5')
    expect(calc.result).to eq(0)
  end

  it 'can subtract two numbers' do
    calc.evaluate('5 - 2')
    expect(calc.result).to eq(3) # This test will fail
  end

  it 'can multiply two numbers' do
    calc.evaluate('6 * 3')
    expect(calc.result).to eq(18)
  end
end
