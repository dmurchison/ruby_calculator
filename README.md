# Ruby RSPEC Testing

## This is a calculator that I built to practice RSPEC testing

* I chose to use a calculator because it is a simple program that I can easily
  test.
* I can add more functionality to the calculator and test it as I go.
  * This allows me to practice writing tests in a more real world scenario.
* However, I am still practicing TDD by writing the tests first and then writing
  the code to pass the tests.

## How to run the tests/program

* Clone the repo
* Run `bundle install`
* Run `bundle exec rspec`

  * **Run the tests using [Docker](./Dockerfile)**
    * Clone the repo
    * Run `docker build -t rspec .`
    * Run `docker run -it rspec`

## Current status of the tests and files

* Classes
  * [Calculator](./classes/calc.rb)
* Tests
  * [Calculator Specs](./spec/calc_spec.rb)
* Configuration
  * [RSpec Configuration](./.rspec)
  * [Gemfile](./Gemfile)
  * [Dockerfile](./Dockerfile)

### Current test results

```sh
Calculator
  strict_mode is disabled
    #evaluate
      evaluates an arithmetic expression
      keeps a running tab on the result
      stores the history of multiple operations
      handles multiple complete expressions
      adds two numbers
      subtracts two numbers
      multiplies two numbers
      calculate the modulo of two numbers
    #history Strict Mode: Disabled
      returns the history of the calculator
  when strict mode is enabled
    #evaluate in strict mode
      raises an error if the first token is not a number (FAILED - 1)
      disallows successive whole expressions (FAILED - 2)
      evaluates multiple operations
      evaluates funky formatted strings
    #history Strict Mode: Enabled
      returns the history of the calculator
    #clear
      clears the result of the previous evaluation (FAILED - 3)


Failures:


  1) Calculator when strict mode is enabled #evaluate in strict mode raises an error if the first token is not a number
     Failure/Error: expect { calc.evaluate("+ 3") }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/calc_spec.rb:79:in `block (4 levels) in <top (required)>'


  2) Calculator when strict mode is enabled #evaluate in strict mode disallows successive whole expressions
     Failure/Error: expect(calc.result).to raise_error(ArgumentError)
       expected ArgumentError but was not given a block
     # ./spec/calc_spec.rb:85:in `block (4 levels) in <top (required)>'


  3) Calculator when strict mode is enabled #clear clears the result of the previous evaluation
     Failure/Error: calc.evaluate("5 + 5")
     ArgumentError:
       Successive whole expressions must start with an operator
     # ./classes/calc.rb:36:in `evaluate'
     # ./spec/calc_spec.rb:114:in `block (4 levels) in <top (required)>'


Finished in 0.00253 seconds (files took 0.04541 seconds to load)
15 examples, 3 failures


Failed examples:


rspec ./spec/calc_spec.rb:78 # Calculator when strict mode is enabled #evaluate in strict mode raises an error if the first token is not a number
rspec ./spec/calc_spec.rb:82 # Calculator when strict mode is enabled #evaluate in strict mode disallows successive whole expressions
rspec ./spec/calc_spec.rb:109 # Calculator when strict mode is enabled #clear clears the result of the previous evaluation
```
