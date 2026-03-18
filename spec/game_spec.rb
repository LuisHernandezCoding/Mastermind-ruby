require_relative '../lib/game'
require_relative '../lib/logic'

describe Game do
  let(:game) { Game.new }
  describe '#initialize' do
    it 'creates a new instance of the Game class' do
      expect(game).to be_a(Game)
    end
  end
end
