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

  describe '#start' do
    it 'prints a welcome message' do
      game = Game.new
      game.start
            
      expect(game.start).to include("Welcome to Connect Four. Enter p to play. Enter q to quit.")
    end
  end
end