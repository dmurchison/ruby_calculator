# frozen_string_literal: true

require('pry-byebug')

class Calculator # rubocop:disable Style/Documentation
  attr_accessor :result

  def evaluate(expression) # rubocop:disable Metrics/MethodLength
    tokens = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    first_operand = tokens.first.to_i
    second_operand = tokens.last.to_i
    operator = tokens[1] # Assuming the operator is always in the middle
    # binding.pry
    case operator # I don't think this is doing anything different than the if statement, but I like it better
    when '+'
      @result = first_operand + second_operand
    when '-'
      @result = first_operand - second_operand
    when '*'
      @result = first_operand * second_operand
    end
    # binding.pry
    @result
  end
end

puts Calculator.new.evaluate('2 * 3') # 6

# Break the string into operands and operator (regex) Didn't use regex
# refactored code and would like to here your thoughts on this approach

# test:
# don't change first three lines of eval method and get subtract methods to pass.