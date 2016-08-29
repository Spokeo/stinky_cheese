class Age
  attr_reader :age

  def initialize(age)
    @age = agify(age)
  end

  def round_down
    return @age if @age < 20 || @age > 100
    if @age % 10 == 0
      @age
    else
      @age - (@age % 10)
    end
  end

  private

  def agify(age)
    raise StinkyCheese::InvalidAgeError, I18n.t('en.age.error.nil') if age.nil?
    begin
      Float(age).round
    rescue ArgumentError
      raise StinkyCheese::InvalidAgeError, I18n.t('en.age.error.non-numerical')
    end
  end
end