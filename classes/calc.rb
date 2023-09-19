# frozen_string_literal: true

class Calculator # rubocop:disable Style/Documentation
  attr_accessor :result # This is a shortcut to create a getter and setter method for the @result instance variable

  def evaluate_add(expression)
    a = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    b = a.map(&:to_i) # { |x| x.to_i } [2, 0, 3] # turn the strings into integers and non numbers into 0
    @result = b.inject(&:+) # { |sum, x| sum + x } # 5 # add the numbers together
  end

  def evaluate_sub(expression)
    a = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    b = a.map(&:to_i) # { |x| x.to_i } [2, 0, 3] # turn the strings into integers and non numbers into 0
    @result = b.reduce(&:-) # { |sum, x| sum + x } # 5 # add the numbers together
  end
end

# Break the string into operands and operator (regex) Didn't use regex
# refactored code and would like to here your thoughts on this approach
