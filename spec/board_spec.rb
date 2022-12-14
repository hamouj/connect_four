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

		it 'has 7 columns' do
		
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

			board.board = {
				'A' => ['A', 'O', 'O', 'O', 'O', 'O'],
				'B' => ['B', 'O', 'O', 'O', 'O', 'O'],
				'C' => ['C', 'X', 'X', 'X', 'X', 'X'],
				'D' => ['D', 'X', 'X', 'X', 'X', 'X'],
				'E' => ['E', 'X', 'X', 'X', 'X', 'X'],
				'F' => ['F', 'X', 'X', 'X', 'X', 'X'],
				'G' => ['G', 'X', 'X', 'X', 'X', 'X']
			}

			board.show_board

			expect(board.rows[0]).to eq(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
			expect(board.rows[5]).to eq(['O', 'O', 'X', 'X', 'X', 'X', 'X'])
		end
	end

	describe 'Checks for Winners' do
		it 'checks for #winner at a row' do
			board.create_board

			expect(board.row_winner_check).to eq(nil)

			board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', '.', '.', 'X'],
				'C' => ['.', '.', '.', '.', '.', 'X'],
				'D' => ['.', '.', '.', '.', '.', 'X'],
				'E' => ['.', '.', '.', '.', '.', 'O'],
				'F' => ['.', '.', '.', '.', '.', 'O'],
				'G' => ['.', '.', '.', '.', '.', 'O']
			}

			board.show_board

			expect(board.row_winner_check).to eq(player)
		end

		it 'checks for #winner at a column' do
			board.create_board

			expect(board.column_winner_check).to eq(nil)

			board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', '.', '.', 'O'],
				'C' => ['.', 'X', 'X', 'X', 'X', 'O'],
				'D' => ['.', '.', '.', '.', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'O', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}

			board.show_board

			expect(board.column_winner_check).to be(player)
		end

		it '#diagonal_arrrays_set_one' do
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

			board.show_board
			#	This returns 8 possible diagonals in sets of 4 from the board plus 1 diagonal that includes nil
			# nil diagonal is later removed in #diagonal_arrays
			expect(board.diagonal_arrays_set_one(board.board.values).count).to eq(9)
			expect(board.diagonal_arrays_set_one(board.board.values)).to include(["1a", "2b", "3c", "4d"])
			expect(board.diagonal_arrays_set_one(board.board.values)).to include(["4c", "5d", "6e", nil])
		end

		it '#diagonal_arrrays_set_two' do
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

			board.show_board
			#	This returns one diagonal array of 4 elements
			expect(board.diagonal_arrays_set_two(board.board.values)).to eq([["3a", "4b", "5c", "6d"]])
		end

		it '#diagonal_arrrays_set_three' do
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

			board.show_board
			#	This returns two diagonal arrays in sets of 4
			expect(board.diagonal_arrays_set_three(board.board.values)).to eq([["1c", "2d", "3e", "4f"], ["2d", "3e", "4f", "5g"]])
		end

		it '#diagonal_arrrays_set_four' do
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

			board.show_board
			#	This returns two diagonal arrays in sets of 4
			expect(board.diagonal_arrays_set_four(board.board.values)).to eq([["1d", "2e", "3f", "4g"]])
		end
		

		it '#diagonal_arrays creates arrays of 4 elements for 12 diagonal possibilities' do
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

			board.show_board
			# There are 12 possible diagonal wins going one way on the board,
			# this combines previous three methods
			expect(board.diagonal_arrays(board.board.values).count).to eq(12)
			expect(board.diagonal_arrays(board.board.values)).to include(["1a", "2b", "3c", "4d"])
			expect(board.diagonal_arrays(board.board.values)).to include(["1d", "2e", "3f", "4g"])
		end

		it '#reversed_board columns' do
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

			board.show_board
			# This sets us up to find the backward 12 possible diagonal wins
			expect(board.reversed_board_columns).to include(['6a', '5a', '4a', '3a', '2a', '1a'])
			expect(board.reversed_board_columns).to include(['6g', '5g', '4g', '3g', '2g', '1g'])
		end


		it 'checks for #winner at a diagonal' do
			board.create_board

			expect(board.diagonal_winner_check).to eq(nil)

			board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', '.', 'X', 'O'],
				'C' => ['.', '.', 'X', 'X', 'X', 'O'],
				'D' => ['.', '.', 'X', 'O', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'O', 'O'],
				'F' => ['.', '.', '.', '.', 'X', 'O'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}

			board.show_board

			expect(board.diagonal_winner_check).to eq(player)
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

			board.show_board
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

			board.show_board
			expect(board.winner).to eq(computer)
		end
	end

  describe 'Intelligent Computer' do
    it 'checks columns for a block' do
      board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', '.', 'O', 'O'],
				'C' => ['.', 'X', 'X', 'X', 'O', 'O'],
				'D' => ['.', '.', '.', '.', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'O', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}

      board.show_board
      board.show_board
      board.winner 
      board.computer_column_block
      expect(board.computer.input).to eq('C')
    end

    it 'checks columns for a win' do
      board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', 'O', 'O', 'O'],
				'C' => ['.', 'X', 'X', 'X', 'O', 'O'],
				'D' => ['.', '.', '.', '.', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'O', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}

      board.show_board
      board.show_board
      board.winner 
      board.computer_column_win
      expect(board.computer.input).to eq('B')
    end
  end
end