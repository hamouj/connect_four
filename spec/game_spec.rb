require './lib/game'
require './lib/player'
require './lib/computer'
require './lib/board'
require './lib/turn'

describe Game do
  describe '#initialize' do
    it 'is an instance of Game' do
      game = Game.new

      expect(game).to be_a(Game)
    end
  end
end