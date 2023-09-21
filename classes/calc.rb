# frozen_string_literal: true

require 'rspec'
require 'pry-byebug'

# Creating a Calculator class
class Calculator
  attr_accessor :result, :operator, :first_operand, :second_operand

  def evaluate(expression) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    tokens = expression.split(' ') # ['2', '+', '3'] # split the string into an array
    @first_operand = tokens.first.to_i
    @second_operand = tokens.last.to_i
    @operator = tokens[1] # Assuming the operator is always in the middle
    # binding.pry
    case operator # I don't think this is doing anything different than the if statement, but I like it better
    when '+'
      @result = first_operand + second_operand
    when '-'
      @result = first_operand - second_operand
    when '*'
      @result = first_operand * second_operand
    when '/'
      @result = first_operand / second_operand
    end
    # binding.pry
    @result
  end
end

c = Calculator.new
puts c.evaluate('2 + 3') # 5
puts c.evaluate('2 - 3') # -1
puts c.evaluate('2 * 3') # 6
puts c.evaluate('12 / 12') # 0
# puts c.evaluate('2 + 3 - 4') # 1
# Using RSpec TDD make this calculator work with more than one operation at a time ie "2 + 3 - 4" should return 1.
