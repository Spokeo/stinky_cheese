class DateOfBirth

  attr_reader :date

  def initialize(dob)
    @date = datify(dob)
  end

  def birthday_is_in_future?
    today = Date.today
    (today.month > @date.month || (today.month == @date.month && today.day >= @date.day)) ? 0 : 1
  end

  private

  def datify(dob)
    raise StinkyCheese::InvalidDobError, I18n.t('en.dob.nil') if dob.nil?
    begin
      date_of_birth = Date.parse(dob.to_s)
      raise StinkyCheese::InvalidDobError, I18n.t('en.dob.future') if date_of_birth > Date.today
      date_of_birth
    rescue ArgumentError, TypeError
      raise StinkyCheese::InvalidDobError, I18n.t('en.dob.non-date')
    end
  end
end