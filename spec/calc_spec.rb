# frozen_string_literal: true

require_relative "../classes/calc" # First I need to load the class/file I want to test
require "rspec"

RSpec.describe Calculator do

  context "strict_mode is disabled" do
    let(:calc) { Calculator.new(strict_mode: false) }

    describe "#evaluate" do
      it "evaluates an arithmetic expression" do
        calc.evaluate("2 + 3")
        calc.evaluate("+ 2")
        expect(calc.history).to be_a(Array)
        expect(calc.history).to eq([5, 7])
      end

      it "keeps a running tab on the result" do
        calc.evaluate("2 + 3")
        calc.evaluate(" + 2")
        expect(calc.result).to eq(7)
      end

      it "stores the history of multiple operations" do
        calc.evaluate("1+2") # 3
        calc.evaluate(" - 1*4") # 8
        calc.evaluate(" + 5-1") # 12
        expect(calc.history).to eq([3, 8, 12])
      end

      it "handles multiple complete expressions" do
        calc.evaluate("1+2")
        expect(calc.result).to eq(3)
        calc.evaluate("3*4")
        expect(calc.result).to eq(12)
        calc.evaluate("5-1")
        expect(calc.result).to eq(4)
        expect(calc.history).to eq([3, 12, 4])
      end

      it "adds two numbers" do
        calc.evaluate("4 + 5")
        expect(calc.result).to eq(9)
      end

      it "subtracts two numbers" do
        calc.evaluate("5 - 2")
        expect(calc.result).to eq(3)
      end

      it "multiplies two numbers" do
        calc.evaluate("6 * 6")
        expect(calc.result).to eq(36)
      end

      it "calculate the modulo of two numbers" do
        calc.evaluate("10 % 4")
        expect(calc.result).to eq(2)
      end
    end

    describe "#history Strict Mode: Disabled" do
      it "returns the history of the calculator" do
        calc.evaluate("2 + 3")
        calc.evaluate("+ 2")
        expect(calc.history).to be_a(Array)
        expect(calc.history).to eq([5, 7])
      end
    end

  end

  context "when strict mode is enabled" do
    let(:calc) { Calculator.new(strict_mode: true) }

    describe "#evaluate in strict mode" do
      it "raises an error if the first token is not a number" do
        expect { calc.evaluate("+ 3") }.to raise_error(ArgumentError)
      end

      it "dissalows successive whole expressions" do
        calc.evaluate("3 * 5")
        calc.evaluate("+ 5")
        expect(calc.result).to raise_error(ArgumentError)
      end

      it "evaluates multiple operations" do
        calc.evaluate("2 + 3 - 4")
        expect(calc.result).to eq(1)
      end

      it "evaluates funky formatted strings" do
        calc.evaluate("25    +5*2")
        expect(calc.result).to eq(60)
      end
    end

    describe "#history Strict Mode: Enabled" do
      it "returns the history of the calculator" do
        calc.evaluate("2 + 3")
        calc.evaluate("+ 2")
        expect(calc.history).to be_a(Array)
        expect(calc.history).to eq([5, 7])
      end
    end

    describe "#clear" do
      it "clears the result of the previous evaluation" do

        ## Arrange
        calc.evaluate("3 * 5")
        expect(calc.result).to eq(15)
        calc.evaluate("5 + 5")
        expect(calc.result).to eq(10)
        expect(calc.history).to eq([15, 10])

        # Action
        calc.clear

        # Assert
        expect(calc.result).to eq(nil) # Assert
        expect(calc.history).to eq([15, 10])
      end
    end

  end

end

## NOTES:
# Don't really need the "can's" in the it blocks
# Defect: Mistake in the code ()
# Error: Is when we have to make an exception to the code (ie. divide by 0).
# We can handle it by either raising an error or returning a string.
# Ruby doesnt assign instance variables until you set an entry.

## Exernal API (The history method can be considered an external API)
# Keeps a history of results so that the user can reference each.

## TODO:
# Write #clear method that only clears the previous output and keeps the history. ✅

# Create a strict mode to only allow running operations and raise an error if
## operations attempted back to back before clearing the previous output. ✅

## Dont rely on the return values of prcedures

# calc.evaluate("2+3") # 5
# calc.evaluate("* 3") # 15
# calc.evaluate("- @1") # @1 refers to history[0]
# calc.result # 10

## Failing Specs
# calc.evaluate("2+3") # 5 # should be 6
# calc.evaluate("* 3") # 15 # should be 18
# calc.evaluate("- @1") # @1 refers to history[0] # should be 10
