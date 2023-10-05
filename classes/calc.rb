# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  OPERATOR_PATTERN = /[+\-*\/%]/.freeze
  attr_accessor :result, :history

  def initialize
    @result = nil
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
      if operator.nil?
        operator = token
        next
      end
      second_operand = token.to_i
      operate(operator, second_operand)
      operator = nil
      second_operand = nil
    end
    @history << @result
  end

  private

  def first_token_is_operator?(tokens)
    tokens.first.match?(OPERATOR_PATTERN)
  end

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
    when "%"
      @result %= second_operand
    else
      raise ArgumentError, "Don't know how to use #{operator} as an operator"
    end
  end

end

# c = Calculator.new
# c.evaluate("2+2")
# c.evaluate("5*10")
# p c.history # ~> [4,4] When it should be [4, 50]

## Something is not resetting @result
