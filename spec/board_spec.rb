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

            board.board_columns = {
                'A' => ['X', 'O', 'O', 'O', 'O', 'O'],
                'B' => ['O', 'O', 'O', 'O', 'O', 'O'],
                'C' => ['X', 'X', 'X', 'X', 'X', 'X'],
                'D' => ['X', 'X', 'X', 'X', 'X', 'X'],
                'E' => ['X', 'X', 'X', 'X', 'X', 'X'],
                'F' => ['X', 'X', 'X', 'X', 'X', 'X'],
                'G' => ['X', 'X', 'X', 'X', 'X', 'X']
            }
            
            expect(board.full?).to eq(true)
        end
    end

end