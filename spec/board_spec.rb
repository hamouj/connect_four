require './lib/board'
require 'rspec'

describe Board do
    describe 'initialize' do

        it 'is an instance of Board' do
            board = Board.new
            
            expect(board).to be_a(Board)
        end

        it '#board_positions' do
            board = Board.new
            expect(board.board_positions.count).to eq(42)
        end

        

    end

end