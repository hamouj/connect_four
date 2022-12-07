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

        it 'checks for #winner at a row' do
            board.create_board

            board.board = {
                'A' => ['.', '.', '.', '.', '.', 'X'],
                'B' => ['.', '.', '.', '.', '.', 'X'],
                'C' => ['.', '.', '.', '.', '.', 'X'],
                'D' => ['.', '.', '.', '.', '.', 'X'],
                'E' => ['.', '.', '.', '.', '.', 'O'],
                'F' => ['.', '.', '.', '.', '.', 'O'],
                'G' => ['.', '.', '.', '.', '.', 'O']
            }

            expect(board.winner).to be(player)
        end

        it 'checks for #winner at a diagonal' do
            board.create_board

            board.board = {
                'A' => ['.', '.', '.', '.', '.', 'X'],
                'B' => ['.', '.', '.', '.', 'X', 'O'],
                'C' => ['.', '.', 'X', 'X', 'X', 'O'],
                'D' => ['.', '.', 'X', 'O', 'O', 'X'],
                'E' => ['.', '.', '.', '.', 'O', 'O'],
                'F' => ['.', '.', '.', '.', 'X', 'O'],
                'G' => ['.', '.', '.', '.', '.', '.']
            }

            expect(board.winner).to be(player)
        end

        it 'checks for #winner at a column' do
            board.create_board

            board.board = {
                'A' => ['.', '.', '.', '.', '.', 'X'],
                'B' => ['.', '.', '.', '.', '.', 'O'],
                'C' => ['.', 'X', 'X', 'X', 'X', 'O'],
                'D' => ['.', '.', '.', '.', 'O', 'X'],
                'E' => ['.', '.', '.', '.', 'O', 'O'],
                'F' => ['.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.']
            }

            expect(board.winner).to be(player)
        end
    end
end