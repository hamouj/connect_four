require './lib/player.rb'
require 'rspec'

describe Player do
    describe 'initialize' do
        it 'is an instance of Player' do
            player1 = Player.new
        end
    end
end