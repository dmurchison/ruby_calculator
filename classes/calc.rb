# frozen_string_literal: true

# Creating a Calculator class
class Calculator
  OPERATOR_PATTERN = /[+\-*\/%]/.freeze
  attr_accessor :result, :history

  # Initializes a new instance of the Calculator class.
  #
  # Parameters:
  # - strict_mode (Boolean): Determines whether strict mode is enabled or not.
  #
  # Returns: None
  def initialize(strict_mode: false)
    @result = nil
    @history = []
    @strict_mode = strict_mode
  end

  # Clears the result of the calculator.
  #
  # Returns: None
  def clear
    @result = nil
  end

  # Evaluates the given expression and performs the corresponding calculations.
  #
  # Parameters:
  # - expression (String): The expression to be evaluated.
  #
  # Returns: None
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

  # Determines if the given tokens represent a successive whole expression.
  #
  # Parameters:
  # - tokens (Array<String>): The tokens to check.
  #
  # Returns:
  # - A boolean value indicating whether the tokens represent a successive whole expression.
  def successive_whole_expression?(tokens)
    @result && !first_token_is_operator?(tokens)
  end

  # Checks if the first token in the given array of tokens is an operator.
  #
  # Parameters:
  # - tokens (Array<String>): An array of tokens.
  #
  # Returns:
  # - A boolean value indicating whether the first token is an operator.
  def first_token_is_operator?(tokens)
    tokens.first.match?(OPERATOR_PATTERN)
  end

  # Performs the specified operation on the first operand and the second operand.
  #
  # Parameters:
  # - operator (String): The operator to be used for the operation.
  # - second_operand (Numeric): The second operand for the operation.
  #
  # Returns:
  # - The result of the operation.
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
