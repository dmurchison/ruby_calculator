# frozen_string_literal: true

class Calculator # rubocop:disable Style/Documentation
  attr_accessor :result # This is a shortcut to creat

  def evaluate(expression)
    tokens = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    first_operand = tokens.first.to_i
    second_operand = tokens.last.to_i
    @result = first_operand + second_operand
  end
end 

# Break the string into operands and operator (regex) Didn't use regex
# refactored code and would like to here your thoughts on this approach
