# frozen_string_literal: true

require_relative '../classes/calc' # First I need to load the class/file I want to test

RSpec.describe Calculator do # I'm describing the Calculator class (from calc.rb)
  let(:calc) { Calculator.new } # This allows me to create an instance of Calculator

  it 'exists' do
    expect(calc).to be_a(Calculator)
  end

  it 'can add two numbers' do
    expect(calc.evaluate('3 + 3')).to eq(6)
  end

  it 'can add two different numbers' do
    expect(calc.evaluate('2 + 3')).to eq(5)
  end
end
