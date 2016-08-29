describe Age do
  let(:base_day) { Date.parse('1995-12-09') }
  before(:each) do
    Timecop.freeze(base_day)
  end
  describe '.round_down' do
    context 'age is below 20' do
      it 'returns the age without any change' do
        age = Age.new(19)
        expect(age.round_down).to eq age.age
      end
    end
    context 'age is already rounded down' do
      it 'returns the age without any change' do
        age = Age.new(20)
        expect(age.round_down).to eq age.age
      end
    end
    context 'age is above 100' do
      it 'returns the age without any change' do
        age = Age.new(190)
        expect(age.round_down).to eq age.age
      end
    end
    context 'age is not already rounded down and is between 20 and 100' do
      it 'brings the age down to the nearest 10-year-marker and returns it' do
        age = Age.new(55)
        expected_age = 50
        expect(age.round_down).to eq expected_age
      end
    end
  end
end