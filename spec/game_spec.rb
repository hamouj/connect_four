require './lib/game'

describe Game do
    describe '#initialize' do
        it 'is an instance of Game' do
            game = Game.new

            expect(game).to be_a(Game)
        end
    end
end