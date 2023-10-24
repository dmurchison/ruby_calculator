# frozen_string_literal: true

# Creating a Calculator class
class Calculator
  OPERATOR_PATTERN = /[+\-*\/%]/.freeze
  attr_accessor :result, :history

  def initialize(strict_mode: false)
    @result = nil
    @history = []
    @strict_mode = strict_mode
  end

  def clear
    @result = nil
  end

  def evaluate(expression)
    tokens = expression.scan(/\d+|#{OPERATOR_PATTERN}/)
    if successive_whole_expression?(tokens)
      raise ArgumentError, "Successive whole expressions must start with an operator" if @strict_mode == true

      clear

    end

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
    @history << @result # Return value not important
  end

  private

  # binding.irb

  def successive_whole_expression?(tokens)
    @result && !first_token_is_operator?(tokens)
  end

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
        @result /= second_operand
      else
        begin
          @result /= second_operand
        rescue ZeroDivisionError
          @result = "You can't divide by 0!"
        end
      end
    when "%"
      @result %= second_operand
    else
      raise ArgumentError, "Don't recognize this operator" if @strict_mode == true
    end
  end

end

# c_f = Calculator.new(strict_mode: false)
# c_t = Calculator.new(strict_mode: true)
# c_f.evaluate("2+2")
# c_f.evaluate("+3")
# c_t.evaluate("5+5")
# c_t.evaluate("+5")
# p c_f.history
# p c_t.history
# p c.evaluate("10/5")
# p c.evaluate("15%2")

## EXPECT => ArgumentError: Don't recognize this operator
## ACTUAL => [4]

# Need another condition to actiavte this or skip through the if statement used
# for strict mode.

# Functions vs Procedures
## Procedures: Change the state
## Dont rely on the return values of procedures

## Functions: Input - Output
