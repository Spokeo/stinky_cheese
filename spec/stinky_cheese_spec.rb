describe StinkyCheese do
  let(:base_day) { Date.parse('1995-12-09') }
  before(:each) do
    Timecop.freeze(base_day)
  end
  describe '.age_from_dob' do
    context 'there is a leap year between today and dob' do
      it 'calculates age given that there are extra days from leap year' do
        dob = Date.parse('1910-01-01')
        before_birthday = Date.parse('2009-12-31')
        after_birthday = Date.parse('2010-01-02')
        Timecop.freeze(before_birthday) do
          expect(StinkyCheese.age_from_dob dob).to eq 99
        end
        Timecop.freeze(after_birthday) do
          expect(StinkyCheese.age_from_dob dob).to eq 100
        end
      end
    end
    context 'there is no leap year between today and dob' do
      it 'returns age accurately' do
        dob = Date.parse('1993-12-08')
        expect(StinkyCheese.age_from_dob(dob)).to eq 2
      end
    end
    context 'dob is on 2/29 and it currently is not a leap year' do
      it 'returns age accurately' do
        dob = Date.parse('1992-02-29')
        expect(StinkyCheese.age_from_dob dob).to eq 3
      end
    end
    context 'dob is on 2/29 and it is a leap year' do
      it 'returns age accurately' do
        dob = Date.parse('1992-02-29')
        today = Date.parse('1996-12-09')
        Timecop.freeze(today) do
          expect(StinkyCheese.age_from_dob dob).to eq 4
        end
      end
    end
    context 'dob is a valid dob String object' do
      it 'parses the string as a date and returns age accurately' do
        dob = '1993-12-08'
        expect(StinkyCheese.age_from_dob dob).to eq 2
      end
    end
    context 'dob is a valid dob Date object' do
      it 'returns age accurately' do
        dob = Date.parse('1993-12-08')
        expect(StinkyCheese.age_from_dob dob).to eq 2
      end
    end
    context 'dob is after today' do
      it 'raises StinkyCheese::InvalidDobError' do
        dob = Date.parse('2001-12-08')
        expect { StinkyCheese.age_from_dob dob }.to raise_error StinkyCheese::InvalidDobError
      end
    end
    context 'dob is today' do
      it 'returns 0' do
        dob = base_day
        expect(StinkyCheese.age_from_dob dob).to eq 0
      end
    end
    context 'today is the birthday' do
      it 'returns age accurately' do
        dob = Date.parse('1994-12-09')
        expect(StinkyCheese.age_from_dob dob).to eq 1
      end
    end
    context 'dob is nil' do
      it 'raises InvalidDobError' do
        dob = nil
        expect { StinkyCheese.age_from_dob dob }.to raise_error StinkyCheese::InvalidDobError
      end
    end
    context 'dob is an invalid object' do
      it 'raises InvalidDobError' do
        dob = {}
        expect { StinkyCheese.age_from_dob dob }.to raise_error StinkyCheese::InvalidDobError
      end
    end
  end
  describe '.stage_of_life' do
    context 'age has a decimal' do
      it 'rounds it to the nearest integer and makes calculations from that' do
        age = 29.7
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.early', age: 30)
      end
    end
    context 'age is a String' do
      it 'parses the age as an integer and makes calculations from that' do
        age = '29.7'
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.early', age: 30)
      end
    end
    context 'age is below 0' do
      it 'raises StinkyCheese::InvalidDobError' do
        age = -1
        expect { StinkyCheese.age_from_dob age }.to raise_error StinkyCheese::InvalidDobError
      end
    end
    context 'age is 0' do
      it 'returns child' do
        age = 0
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.child')
      end
    end
    context 'age is that of a teenager' do
      it 'returns Teenager' do
        age = 15
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.teenager')
      end
    end
    context 'age is in early 20s' do
      it 'returns Early 20\'s' do
        age = 23
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.early', age: 20)
      end
    end
    context 'age is in mid 30s' do
      it 'returns Mid 30\'s' do
        age = 36
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.mid', age: 30)
      end
    end
    context 'age is in late 40s' do
      it 'returns Late 40\'s' do
        age = 49
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.late', age: 40)
      end
    end
    context 'age is 50' do
      it 'returns Early 50\'s' do
        age = 50
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.early', age: 50)
      end
    end
    context 'age is 64' do
      it 'returns Mid 60\'s' do
        age = 64
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.mid', age: 60)
      end
    end
    context 'age is 75' do
      it 'returns Mid 70\'s' do
        age = 75
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.mid', age: 70)
      end
    end
    context 'age is 78' do
      it 'returns Late 70\'s' do
        age = 78
        expect(StinkyCheese.stage_of_life age).to eq I18n.t('en.age.stage.late', age: 70)
      end
    end
    context 'age is not a number' do
      it 'raises StinkyCheese::InvalidAgeError' do
        age = 'r'
        expect { StinkyCheese.stage_of_life age }.to raise_error StinkyCheese::InvalidAgeError
      end
    end
    context 'age is nil' do
      it 'raises StinkyCheese::InvalidAgeError' do
        age = nil
        expect { StinkyCheese.stage_of_life age }.to raise_error StinkyCheese::InvalidAgeError
      end
    end
  end
end