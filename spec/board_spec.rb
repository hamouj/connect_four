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
            expect(board.create_board.count).to eq(42)
        end

        it 'can tell us if the board is full' do
            board = Board.new.create_board

            expect(board.full?).to eq(false)

            board.positions.map! {|position| position = 'X'}
            
            expect(board.full?).to eq(true)
        end
    end

end