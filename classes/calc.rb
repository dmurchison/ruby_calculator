# frozen_string_literal: true

class Calculator # rubocop:disable Style/Documentation
  attr_accessor :result

  def evaluate(expression)
    tokens = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    first_operand = tokens.first.to_i
    second_operand = tokens.last.to_i
    operator = tokens[1]
    if operator == "+"
      @result = first_operand + second_operand
    elsif operator == "-"
      @result = first_operand - second_operand
    end
  end
end

# Break the string into operands and operator (regex) Didn't use regex
# refactored code and would like to here your thoughts on this approach

# test:
# don't change first three lines of eval method and get subtract methods to pass.