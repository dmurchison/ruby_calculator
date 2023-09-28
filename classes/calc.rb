# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  attr_accessor :result

  def evaluate(expression)
    tokens = expression.scan(/\d+|[+\-*\/%]/) # \d+ = one or more digits, | = or, [+\-*\/%] = one of these characters
    operator = nil # set this to nil so we can use it in the operate method
    second_operand = nil # set this to nil so we can use it in the operate method

    tokens.each do |token| # token is a variable that represents each element in the array
      if @result.nil? # if result is nil, set it to the first token
        @result = token.to_i # to_i converts a string to an integer
        next # next skips the rest of the code in the loop and goes to the next iteration
      end
      if operator.nil? # if operator is nil, set it to the next token
        operator = token # this is the operator
        next # next skips the rest of the code in the loop and goes to the next iteration
      end
      second_operand = token.to_i # set the second operand to the next token
      operate(operator, second_operand) # call the operate method
      operator = nil # set operator back to nil so we can use it in the next iteration
      second_operand = nil # set second_operand back to nil so we can use it in the next iteration
    end
  end

  private

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
    end
  end

end

c = Calculator.new
c.evaluate("2 + 3")
p c.result
# p c.evaluate("2 - 3") # -1
# p c.evaluate("2 * 3") # 6
# p c.evaluate("12 / 0") # ZeroDivisionError
# p c.evaluate("15 / 15") # Always 1
# p c.evaluate("2 + 3 - 4") # 1

# Using RSpec TDD make this calculator work with more than one operation at a time ie "2 + 3 - 4" should return 1.
# Create assertion about evaluation and execution

# Defect: Mistake in the code ()
# Error: Is when we have to make an exception to the code (ie. divide by 0).
# We can handle it by either raising an error or returning a string.
