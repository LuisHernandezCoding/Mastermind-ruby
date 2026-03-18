require_relative '../lib/logic'

# CREATE TESTS FOR MASTERMIND GAME LOGIC
describe Logic do
  let(:logic) { Logic.new }
  describe '#initialize' do
    it 'creates a new instance of the Logic class' do
      expect(logic).to be_a(Logic)
    end
  end
  describe '#generate_code' do
    it 'generates a random code of 4 colors' do
      expect(logic.generate_code(4).length).to eql(4)
    end
  end
  describe '#check_code' do
    it 'checks if the code is a valid code' do
      expect(logic.check_code('rgby')).to eq(true)
    end
    it 'checks if the code is not a valid code' do
      expect(logic.check_code('rgbo')).to eq(false)
    end
  end
  describe '#check_guess' do
    it 'checks if the guess is a valid guess' do
      expect(logic.check_guess('rgby', 4)).to eq(true)
    end
    it 'checks if the guess is not a valid guess' do
      expect(logic.check_guess('rgbyy', 4)).to eq(false)
    end
  end
  describe '#check_win' do
    it 'checks if the guess is a win' do
      expect(logic.check_win('rgby', 'rgby')).to eq(true)
    end
    it 'checks if the guess is not a win' do
      expect(logic.check_win('rgby', 'rgbo')).to eq(false)
    end
  end
  describe '#check_exact_match' do
    it 'checks if the guess has an exact match' do
      expect(logic.check_exact_match('rgby', 'rgbo')).to eq(3)
    end
  end
  describe '#check_color_match' do
    it 'checks if the guess has a color match' do
      expect(logic.check_color_match('rgby', 'rgby')).to eq(4)
    end
    it 'checks if the guess has a color match' do
      expect(logic.check_color_match('rgby', 'rgbo')).to eq(3)
    end
    it 'checks if the guess has a color match' do
      expect(logic.check_color_match('rgby', 'rgoo')).to eq(2)
    end
    it 'checks if the guess has a color match' do
      expect(logic.check_color_match('rgby', 'rops')).to eq(1)
    end
  end
end
