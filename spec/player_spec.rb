require './lib/player.rb'
require 'rspec'

describe Player do
    describe 'initialize' do
        it 'is an instance of Player' do
            player1 = Player.new('Koa')
        end
    end

    it "checks if player's input is valid" do
        player1 = Player.new('Koa')
        player1.input = 'A'

        expect(player1.valid_input?).to be(true)

        player1.input = 'K'
        expect(player1.valid_input?).to be(false)

        player1.input = 'A2'
        expect(player1.valid_input?).to be(false)
    end
end