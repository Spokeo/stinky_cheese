class LifeEventDate

  attr_reader :date

  def initialize(dob)
    @date = datify(dob)
  end

  def in_future?
    today = Date.today
    (today.month > @date.month || (today.month == @date.month && today.day >= @date.day)) ? 0 : 1
  end

  private

  def datify(dob)
    raise StinkyCheese::InvalidDateError, I18n.t('en.life-event-date.error.nil') if dob.nil?
    begin
      Date.parse(dob.to_s)
    rescue ArgumentError, TypeError
      raise StinkyCheese::InvalidDateError, I18n.t('en.life-event-date.error.non-date')
    end
  end
end