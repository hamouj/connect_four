require './lib/board'
require './lib/player'
require './lib/computer'
require 'rspec'

describe Board do
    let(:player) {Player.new('Koa')}
    let(:board) {Board.new(player)}

    describe 'initialize' do

        it 'is an instance of Board' do
            
            expect(board).to be_a(Board)
        end

        it '#board_positions' do
            expect(board.create_board.keys.count).to eq(7)
        end

        it 'can tell us if the board is full' do
            board.create_board

            expect(board.full?).to eq(false)

            board.board = {
                'A' => ['A', 'O', 'O', 'O', 'O', 'O'],
                'B' => ['B', 'O', 'O', 'O', 'O', 'O'],
                'C' => ['C', 'X', 'X', 'X', 'X', 'X'],
                'D' => ['D', 'X', 'X', 'X', 'X', 'X'],
                'E' => ['E', 'X', 'X', 'X', 'X', 'X'],
                'F' => ['F', 'X', 'X', 'X', 'X', 'X'],
                'G' => ['G', 'X', 'X', 'X', 'X', 'X']
            }
            
            expect(board.full?).to eq(true)
        end
    end
end