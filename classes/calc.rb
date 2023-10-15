# frozen_string_literal: true

require "rspec"
require "pry-byebug"

# Creating a Calculator class
class Calculator
  OPERATOR_PATTERN = /[+\-*\/%]/.freeze
  attr_accessor :result, :history

  def initialize(strict_mode: false)
    @result = nil
    @history = []
    @strict_mode = strict_mode
  end

  def clear_output
    @result = nil
  end

  def func
    "This function will always return THIS!"
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
      if @strict_mode == true
        begin
          @result /= second_operand
        rescue ZeroDivisionError
          @result = "You can't divide by 0!"
        end
      else
        @result /= second_operand
      end
    when "%"
      @result %= second_operand
    else
      raise ArgumentError, "Don't recognize this operator" if strict_mode == true
    end
  end

end

c = Calculator.new(strict_mode: true)
p c.evaluate("2+2")
p c.evaluate("5*10")
p c.evaluate("10/0")
p c.evaluate("10/5")
p c.evaluate("15%2")
p c.evaluate("4@7")
# Need another condition to actiavte this or skip through the if statement used
# for strict mode.
