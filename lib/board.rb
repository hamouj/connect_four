class Board
	attr_accessor :board
	attr_reader :computer, :player, :rows

	def initialize(player, computer)
		@player = player	
		@rows = []
		@computer = computer
		@temp_array = []
	end

	def create_board
		@board = {
			'A' => ['.', '.', '.', '.', '.', '.'],
			'B' => ['.', '.', '.', '.', '.', '.'],
			'C' => ['.', '.', '.', '.', '.', '.'],
			'D' => ['.', '.', '.', '.', '.', '.'],
			'E' => ['.', '.', '.', '.', '.', '.'],
			'F' => ['.', '.', '.', '.', '.', '.'],
			'G' => ['.', '.', '.', '.', '.', '.']
		}
	end

	def full?
		all_positions = @board.values.flatten
		if all_positions.include?('.')
			false
		else
			true
		end
	end

	def print_board
		# Board prints in rows, so created an array of rows in the proccess
		puts "A B C D E F G"
		counter = 0
		6.times do
			row = []
			board.each do |key, value|
				print "#{value[counter]} "
				row << "#{value[counter]}"
			end
			puts "\n"
			counter += 1
		@rows << row
		end
	end

	def row_winner_check
		n = 0
		winner_array_checks = []
		@rows.map {|n| n.each_cons(4) {|element| winner_array_checks.push(element)}}

		check_array_for_winner(winner_array_checks)
	end

	def column_winner_check
		winner_array_checks = []
		@board.values.map {|n| n.each_cons(4) {|element| winner_array_checks.push(element)}}
		check_array_for_winner(winner_array_checks)
	end

	def diagonal_arrays(array)
		diagonal_arrays_set_one(array)
		diagonal_arrays_set_two(array)
		diagonal_arrays_set_three(array)
		diagonal_arrays_set_four(array)

		@temp_array.delete_if {|n| n.include?(nil)}
		return @temp_array
	end

	def diagonal_arrays_set_one(array)
		i = 0
		n = 3
		until n == 6
			@temp_array << (i..n).collect {|i| array[i][i]}
			@temp_array << (i..n).collect {|i| array[i+1][i]}
			@temp_array << (i..n).collect {|i| array[i][i+1]}
			i += 1
			n += 1
		end
		@temp_array
	end

	def diagonal_arrays_set_two(array)
		i = 0
		n = 1
		@temp_array << (i..3).collect {|i| array[i][n+=1]}
	end

	def diagonal_arrays_set_three(array)
		i = 0
		n = 3
		2.times do
			@temp_array << (i..n).collect {|i| array[i+2][i]}
			i += 1
			n += 1
		end
		@temp_array
	end

	def diagonal_arrays_set_four(array)
		i = 0
		n = -1
		@temp_array << (i..3).collect {|i| array[i+3][n+=1]}
	end

	def reversed_board_columns
		temp_board = @board.dup
		reverse_board = temp_board.map {|key, value| value.reverse}
	end

	def diagonal_winner_check
		winner_array_checks = []
		temp_board = @board.dup
		winner_array_checks.concat(diagonal_arrays(temp_board.values))
		winner_array_checks.concat(diagonal_arrays(reversed_board_columns))
		check_array_for_winner(winner_array_checks)
	end

	def check_array_for_winner(array)
		winner = nil
		array.each do |array|
			if array == ['X', 'X', 'X', 'X']
				winner = player
				break
			elsif array == ["O", "O", "O", "O"]
				winner = computer
				break
			end
		end
		return winner
	end

	def winner
		game_winner = []
		game_winner << column_winner_check
		game_winner << row_winner_check
		game_winner << diagonal_winner_check
		game_winner.compact!
		return game_winner[0]
	end
end