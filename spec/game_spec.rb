require './lib/game'

describe Game do
    describe '#initialize' do
        it 'is an instance of Game' do
            game = Game.new

            expect(game).to be_a(Game)
        end
    end

    describe '#start'do
        it 'prints a welcome message' do
            game = Game.new
            game.start
            
            expect(game.start).to eq("Welcome to Connect Four. Enter p to play. Enter q to quit.")
        end
    end
end