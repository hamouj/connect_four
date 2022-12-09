require './lib/board'
require './lib/player'
require './lib/computer'
require 'rspec'

describe Board do
    let(:computer) {Computer.new}
    let(:player) {Player.new('Koa')}
    let(:board) {Board.new(player, computer)}


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

        it 'creates rows during #print_board' do
            board.create_board
            board.print_board

            expect(board.rows).to eq([[".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."]])
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

            board.print_board

            expect(board.row_winner_check).to eq(player)
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

            board.print_board

            expect(board.diagonal_winner_check).to eq(player)
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

            board.print_board

            expect(board.column_winner_check).to be(player)
        end

        it '#diagonal_arrays creates arrays of 4 elements for all diagonal possibilities' do
            board.create_board

            board.board = {
                'A' => ['1a', '2a', '3a', '4a', '5a', '6a'],
                'B' => ['1b', '2b', '3b', '4b', '5b', '6b'],
                'C' => ['1c', '2c', '3c', '4c', '5c', '6c'],
                'D' => ['1d', '2d', '3d', '4d', '5d', '6d'],
                'E' => ['1e', '2e', '3e', '4e', '5e', '6e'],
                'F' => ['1f', '2f', '3f', '4f', '5f', '6f'],
                'G' => ['1g', '2g', '3g', '4g', '5g', '6g']
            }

            board.print_board
            expect(board.diagonal_arrays(board.board.values)).to eq([["1a", "2b", "3c", "4d"], ["1b", "2c", "3d", "4e"], ["2a", "3b", "4c", "5d"], ["2b", "3c", "4d", "5e"], ["2c", "3d", "4e", "5f"], ["3b", "4c", "5d", "6e"], ["3c", "4d", "5e", "6f"], ["3d", "4e", "5f", "6g"], ["3a", "4b", "5c", "6d"], ["1c", "2d", "3e", "4f"], ["2d", "3e", "4f", "5g"], ["1d", "2e", "3f", "4g"]])
        end

        it 'has a player #winner' do
            board.create_board

            board.board = {
                'A' => ['.', '.', '.', '.', '.', 'X'],
                'B' => ['.', '.', '.', '.', 'X', 'O'],
                'C' => ['.', 'X', 'X', 'X', 'X', 'O'],
                'D' => ['.', '.', '.', '.', 'O', 'X'],
                'E' => ['.', '.', '.', '.', 'O', 'O'],
                'F' => ['.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.']
            }

            board.print_board
            expect(board.winner).to eq(player)
        end

        it 'has a computer #winner' do
            board.create_board

            board.board = {
                'A' => ['.', '.', '.', '.', '.', 'X'],
                'B' => ['.', '.', '.', '.', 'O', 'O'],
                'C' => ['.', 'X', 'X', 'X', 'O', 'O'],
                'D' => ['.', '.', '.', '.', 'O', 'X'],
                'E' => ['.', '.', '.', '.', 'O', 'O'],
                'F' => ['.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.']
            }

            board.print_board
            expect(board.winner).to eq(computer)
        end
    end
end