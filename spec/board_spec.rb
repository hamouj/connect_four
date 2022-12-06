require './lib/board'
require 'rspec'

describe Board do
    describe 'initialize' do
        it 'is an instance of Board' do
            board = Board.new
            
            expect(board).to be_a(Board)
        end
    end
end