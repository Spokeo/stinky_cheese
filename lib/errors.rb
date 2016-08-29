module StinkyCheese
  class StinkyCheeseBaseError < StandardError; end
  class InvalidDateError < StinkyCheeseBaseError; end
  class InvalidAgeError < StinkyCheeseBaseError; end
end