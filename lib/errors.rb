module StinkyCheese
  class StinkyCheeseBaseError < StandardError; end
  class InvalidDobError < StinkyCheeseBaseError; end
  class InvalidAgeError < StinkyCheeseBaseError; end
end