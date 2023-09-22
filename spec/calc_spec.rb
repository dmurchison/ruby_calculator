# frozen_string_literal: true

require_relative "../classes/calc" # First I need to load the class/file I want to test
require "rspec"

RSpec.describe Calculator do
  let(:calc) { Calculator.new } # This is a helper method that will create a new instance of the Calculator class

  it "exists" do
    expect(calc).to be_a(Calculator)
  end

  it "can add two numbers" do
    calc.evaluate("4 + 5")
    expect(calc.result).to eq(9)
  end

  it "can subtract two numbers" do
    calc.evaluate("5 - 2")
    expect(calc.result).to eq(3)
  end

  it "can multiply two numbers" do
    calc.evaluate("6 * 6")
    expect(calc.result).to eq(36)
  end

  it "returns a string explaining why this will always return 0" do
    calc.evaluate("10 / 15")
    expect(calc.result).to be_a(String)
  end

  it "returns a string explaining why this will always return 1" do
    calc.evaluate("10 / 10")
    expect(calc.result).to be_a(String)
  end

  it "can divide by 0 without raising ZeroDivisionError and an explanation" do
    expect { calc.evaluate("5 / 0") }.to_not raise_error
  end

  xit "can evaluate multiple operations" do
    calc.evaluate("2 + 3 - 4")
    expect(calc.result).to eq(1)
  end

end