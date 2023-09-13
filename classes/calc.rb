# frozen_string_literal: true

# class Calculator
class Calculator
  attr_reader :total

  def initialize
    @total = 0
  end

  def clear
    @total = 0
  end

  def add(number)
    @total += number
  end

  def subtract(number)
    @total -= number
  end

  def multiply(number)
    @total *= number
  end

end

calc = Calculator.new
p calc.total
p calc.add(5)
p calc.total
p calc.subtract(3)
