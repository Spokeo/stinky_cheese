describe LifeEventDate do
  let(:base_day) { Date.parse('1995-12-09') }
  before(:each) do
    Timecop.freeze(base_day)
  end
  describe '#in_future?' do
    context 'birthday has not passed' do
      it 'returns 1' do
        dob = LifeEventDate.new('1993-12-10')
        expect(dob.in_future?).to eq 1
      end
    end
    context 'birthday is today' do
      it 'returns 0' do
        dob = LifeEventDate.new('1993-12-09')
        expect(dob.in_future?).to eq 0
      end
    end
    context 'birthday has passed' do
      it 'returns 0' do
        dob = LifeEventDate.new('1993-11-10')
        expect(dob.in_future?).to eq 0
      end
    end
    context 'dob is on 2/29 and it is not a leap year' do
      context 'birthday has passed' do
        it 'returns 0' do
          dob = LifeEventDate.new('1988-02-29')
          expect(dob.in_future?).to eq 0
        end
      end
      context 'birthday has not passed' do
        it 'returns 1' do
          dob = LifeEventDate.new('1988-12-29')
          expect(dob.in_future?).to eq 1
        end
      end
    end
  end

  describe '#datify' do
    let(:expected_dob) { Date.parse('1988-12-29') }
    context 'dob is a Time object' do
      it 'returns the dob' do
        dob = LifeEventDate.new('1988-12-29')
        input_dob = Time.parse('1988-12-29')
        expect(dob.send(:datify, expected_dob)).to eq expected_dob
      end
    end
    context 'dob is a DateTime object' do
      it 'returns the dob' do
        dob = LifeEventDate.new('1988-12-29')
        input_dob = DateTime.parse('1988-12-29')
        expect(dob.send(:datify, input_dob)).to eq expected_dob
      end
    end
    context 'dob is a Date object' do
      it 'returns the dob' do
        dob = LifeEventDate.new('1988-12-29')
        input_dob = Date.parse('1988-12-29')
        expect(dob.send(:datify, input_dob)).to eq expected_dob
      end
    end
    context 'dob is a String object' do
      it 'parses the dob into a Time object and returns it' do
        dob_string = '1988-12-29'
        dob = LifeEventDate.new('1988-12-30')
        input_dob = '1988-12-29'
        expect(dob.send(:datify, input_dob)).to eq expected_dob
      end
    end
  end
end