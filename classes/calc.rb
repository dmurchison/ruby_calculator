
class Calculator
  
  def evaluate(expression)
    @res = expression.to_i + expression.reverse.to_i
  end

  def result
    @res
  end

  

end


# SUDO
# Break the string into operands and operator (regex)
# Turn the operands into numbers (parse)
# Do the evaluation