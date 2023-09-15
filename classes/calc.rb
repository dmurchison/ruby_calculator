# frozen_string_literal: true

# Calculator Class
class Calculator
  attr_accessor :result

  def evaluate(expression)
    expression.to_i + expression.reverse.to_i
  end
end

# SUDO
# Break the string into operands and operator (regex)
# Turn the operands into numbers (parse)
# Do the evaluation
