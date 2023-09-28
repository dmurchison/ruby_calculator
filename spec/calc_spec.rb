# frozen_string_literal: true

require_relative "../classes/calc" # First I need to load the class/file I want to test
require "rspec"

RSpec.describe Calculator do
  let(:calc) { Calculator.new } # This is a helper method that will create a new instance of the Calculator class

  describe "#evaluate" do
    it "can turn any string into a well formatted expression" do
      expect { calc.evaluate("2 + 3").to be_a(Array) }
      expect { calc.evaluate("2 + 3*100").to eq(["2", "+", "3", "*", "100"]) }
    end
  end

  describe "#operate" do
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

    it "can divide by 0 without raising ZeroDivisionError and an explanation" do
      expect { calc.evaluate("5 / 0") }.to_not raise_error
      expect(calc.result).to be_a(String)
    end

    it "can evaluate multiple operations" do
      calc.evaluate("2 + 3 - 4")
      expect(calc.result).to eq(1)
    end

    it "can evaluate funky formatted strings" do
      calc.evaluate("25    +5*2")
      expect(calc.result).to eq(60)
    end
  end

end
