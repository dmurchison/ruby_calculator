# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  OPERATOR_PATTERN = /[+\-*\/%]/.freeze
  attr_accessor :result, :history

  def initialize
    @result = nil # Nice tiny documentation for the beginning state
    @history = []
  end

  def clear_output
    @result = nil
  end

  def evaluate(expression)
    tokens = expression.scan(/\d+|#{OPERATOR_PATTERN}/)
    clear_output if @result && !first_token_is_operator?(tokens)
    operator = nil
    second_operand = nil
    tokens.each do |token|
      if @result.nil?
        @result = token.to_i
        next
      end
      if operator.nil? # if operator is nil, set it to the next token
        operator = token # this is the operator
        next # next skips the rest of the code in the loop and goes to the next iteration
      end
      second_operand = token.to_i # set the second operand to the next token
      operate(operator, second_operand) # call the operate method
      operator = nil # set operator back to nil so we can use it in the next iteration
      second_operand = nil # set second_operand back to nil so we can use it in the next iteratio
    end
    @history << @result
  end

  private

  def first_token_is_operator?(tokens)
    tokens.first.match?(OPERATOR_PATTERN)
  end

  def operate(operator, second_operand) # this method is private because we don't call it outside of the class
    case operator # case operator is the same as if operator == "+"
    when "+" # when operator is "+", add the second operand to the result
      @result += second_operand
    when "-" # when operator is "-", subtract the second operand from the result
      @result -= second_operand
    when "*" # when operator is "*", multiply the second operand by the result
      @result *= second_operand
    when "/" # when operator is "/", divide the result by the second operand
      begin
        @result /= second_operand
      rescue ZeroDivisionError
        @result = "You can't divide by 0!" # Return this instead of raising an error if the user tries to divide by 0.
      end
    else
      raise ArgumentError, "Don't know how to use #{operator} as an operator"
    end
  end

end

# Using RSpec TDD make this calculator work with more than one operation at a time ie "2 + 3 - 4" should return 1.
# Create assertion about evaluation and execution

# Defect: Mistake in the code ()
# Error: Is when we have to make an exception to the code (ie. divide by 0).
# We can handle it by either raising an error or returning a string.

# Once we have a result, we can continue to operate on the result.

# Exernal API
# Keeps a history of results so that the user can reference each.

# Problem:
## This is storing only the history of the first operation over and over again ie...
# c = Calculator.new
# c.evaluate("2+2")
# c.evaluate("5*10")
# p c.history # ~> [4,4] When it should be [4, 50]

## Something is not resetting @result

# Ruby doesnt assign instance variables until you set an entry
