require 'stinky_cheese/version'
require 'life_event_date'
require 'age'
module StinkyCheese
  def self.age_from_dob(dob, dod = Time::now)
    date_of_birth = LifeEventDate.new(dob)
    date_of_death = LifeEventDate.new(dod)
    date_of_death.date.year - date_of_birth.date.year - date_of_birth.in_future?
  end

  def self.stage_of_life(age)
    age = Age.new(age)
    formatted_age = age.age
    lowered_age = age.round_down

    if formatted_age.between?(0, 12)
      I18n.t 'en.age.stage.child'
    elsif formatted_age.between?(13, 19)
      I18n.t 'en.age.stage.teenager'
    elsif formatted_age.between?(lowered_age, lowered_age + 3)
      I18n.t 'en.age.stage.early', age: lowered_age
    elsif formatted_age.between?(lowered_age + 4, lowered_age + 6)
      I18n.t 'en.age.stage.mid', age: lowered_age
    else formatted_age > lowered_age + 6
      I18n.t 'en.age.stage.late', age: lowered_age
    end
  end
end
