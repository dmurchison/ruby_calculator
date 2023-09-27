# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  attr_accessor :result

  def evaluate(expression)
    tokens = expression.scan(/\d+|[+\-*\/%]/)
    operator = nil
    second_operand = nil

    tokens.each do |token|
      if @result.nil?
        @result = token.to_i
        next
      end
      if operator.nil?
        operator = token
        next
      end
      second_operand = token.to_i
      operate(operator, second_operand)
      operator = nil
      second_operand = nil
    end
  end

  private

  def operate(operator, second_operand)
    case operator
    when "+"
      @result += second_operand
    when "-"
      @result -= second_operand
    when "*"
      @result *= second_operand
    when "/"
      begin
        @result /= second_operand
      rescue ZeroDivisionError
        @result = "You can't divide by 0!"
      end
    end
  end

end

c = Calculator.new
p c.evaluate("2 + 3") # 5
p c.evaluate("2 - 3") # -1
p c.evaluate("2 * 3") # 6
p c.evaluate("12 / 0") # ZeroDivisionError
p c.evaluate("15 / 15") # Always 1
p c.evaluate("2 + 3 - 4") # 1

# Using RSpec TDD make this calculator work with more than one operation at a time ie "2 + 3 - 4" should return 1.
# Create assertion about evaluation and execution

# Defect: Mistake in the code ()
# Error: Is when we get

# Write a test that can handle string inputs and the spacing between operators and operands