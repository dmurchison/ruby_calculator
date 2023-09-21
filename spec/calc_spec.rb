# frozen_string_literal: true

require_relative '../classes/calc' # First I need to load the class/file I want to test
require 'rspec'

RSpec.describe Calculator do # rubocop:disable Metrics/BlockLength
  let(:calc) { Calculator.new } # This is a helper method that will create a new instance of the Calculator class

  it 'exists' do
    expect(calc).to be_a(Calculator)
  end

  it 'can add the same number' do
    calc.evaluate('2 + 2')
    expect(calc.result).to eq(4)
  end

  it 'can add two different numbers' do
    # This is a different test yet very similar to the one above, I don't understand 
    calc.evaluate('4 + 5')
    expect(calc.result).to eq(9)
  end

  it 'can subtract the same number' do
    calc.evaluate('5 - 5')
    expect(calc.result).to eq(0)
  end

  it 'can subtract two different numbers' do
    calc.evaluate('5 - 2')
    expect(calc.result).to eq(3) # This test will fail
  end

  it 'can multiply the same number' do
    calc.evaluate('6 * 6')
    expect(calc.result).to eq(36)
  end

  it 'can multiply two different numbers' do
    calc.evaluate('6 * 7')
    expect(calc.result).to eq(42)
  end

  it 'can divide the same number' do
    if calc.operator == '/' && calc.first_operand == calc.second_operand
      raise Error, 'This will always be 1'
    end
  end
end
