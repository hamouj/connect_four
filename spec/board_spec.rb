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
            expect(board.create_board.keys.count).to eq(7)
        end

        it 'can tell us if the board is full' do
            board = Board.new
            board.create_board

            expect(board.full?).to eq(false)

            board.positions.map! {|position| position = 'X'}
            
            expect(board.full?).to eq(true)
        end
    end

end