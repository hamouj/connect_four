class Board
	attr_accessor :board,
                :l_block_index,
                :r_block_index 
	attr_reader :computer, 
              :player, 
              :rows,
              :column_block,
              :column_win,
              :all_arrays

	def initialize(player, computer)
		@player = player	
		@rows = []
		@computer = computer
		@temp_array = []
    @column_block = []
    @column_win = []
    @all_arrays = []
    @l_block_index = nil
    @r_block_index = nil 
    @d_set_1 = [0, 2, 8]
    @d_set_2 = [1, 3, 5]
    @d_set_3 = [7, 10, 11]
    @d_set_4 = [4, 9]
    @r_set_1 = [0, 4, 8, 12, 16, 20]
    @r_set_2 = [1, 5, 9, 13, 17, 21]
    @r_set_3 = [2, 6, 10, 14, 18, 22]
    @r_set_4 = [3, 7, 11, 15, 19, 23]
	end

	def create_board
		@rows = []
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

	def show_board
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

  # Start of intelligent computer
  def computer_column_block
    board.each do |key, value|
      board[key].each_cons(4) do |element|
        @column_block << key if element == ['.','X', 'X', 'X']
      end
    end 
    computer.input = @column_block.first if !@column_block.empty?
  end

  def computer_column_win
    board.each do |key, value|
      board[key].each_cons(4) do |element|
        @column_win << key if element == ['.','O', 'O', 'O']
      end
    end 
    computer.input = @column_win.first if !@column_win.empty?
  end

  def groups_of_four
    @rows.shift(6)
    n = 0
    @rows.reverse.map {|n| n.each_cons(4) {|element| @all_arrays.push(element)}}
    @all_arrays.concat(@temp_array.first(24))
  end 

  def left_block_check
    @all_arrays.find {|section| @l_block_index = @all_arrays.index(section) if section == ['.', 'X', 'X', 'X']}
    if (0..23).include?(@l_block_index)
      row_l_block
    elsif (24..36).include?(@l_block_index)
      d_l_block
    elsif (36..47).include?(@l_block_index)
      rd_l_block
    end 
  end 
  
  def row_l_block
    if (@r_set_1).include?(@l_block_index)
      computer.input = 'A'
    elsif (@r_set_2).include?(@l_block_index)
      computer.input = 'B'
    elsif (@r_set_3).include?(@l_block_index)
      computer.input = 'C'
    elsif (@r_set_4).include?(@l_block_index)
      computer.input = 'D'
    end 
  end

  def d_l_block
    d_l_block = (@l_block_index) - 24
    if @d_set_1.include?(d_l_block)
      computer.input = 'A'
    elsif @d_set_2.include?(d_l_block)
      computer.input = 'B'
    elsif @d_set_3.include?(d_l_block)
      computer.input = 'D'
    elsif @d_set_4.include?(d_l_block) || d_l_block == 6
      computer.input = 'C'
    end 
  end 

  def rd_l_block
    rd_l_block = (@l_block_index) - 36
    if @d_set_1.include?(rd_l_block)
      computer.input = 'A'
    elsif @d_set_2.include?(rd_l_block)
      computer.input = 'B'
    elsif @d_set_3.include?(rd_l_block)
      computer.input = 'D'
    elsif @d_set_4.include?(rd_l_block) || rd_l_block == 6
      computer.input = 'C'
    end 
  end 

  def right_block_check
    @all_arrays.find {|section| @r_block_index = all_arrays.index(section) if section == ['X', 'X', 'X', '.']}
    if (0..23).include?(@r_block_index)
      row_r_block
    elsif (24..35).include?(@r_block_index)
      d_r_block
    elsif (36..47).include?(@r_block_index)
      rd_r_block
    end 
  end 

  def row_r_block
    if (@r_set_1).include?(@r_block_index)
      computer.input = 'D'
    elsif (@r_set_2).include?(@r_block_index)
      computer.input = 'E'
    elsif (@r_set_3).include?(@r_block_index)
      computer.input = 'F'
    elsif (@r_set_4).include?(@r_block_index)
      computer.input = 'G'
    end 
  end

  def d_r_block
    d_r_block = (@r_block_index) - 24
    if @d_set_1.include?(d_r_block)
      computer.input = 'D'
    elsif @d_set_2.include?(d_r_block)
      computer.input = 'E'
    elsif @d_set_3.include?(d_r_block) || d_r_block == 6
      computer.input = 'G'
    elsif @d_set_4.include?(d_r_block)
      computer.input = 'F'
    end 
  end 

  def rd_r_block
    rd_r_block = (@r_block_index) - 36
    if @d_set_1.include?(rd_r_block)
      computer.input = 'D'
    elsif @d_set_2.include?(rd_r_block)
      computer.input = 'E'
    elsif @d_set_3.include?(rd_r_block)
      computer.input = 'G'
    elsif @d_set_4.include?(rd_r_block) | rd_r_block == 6
      computer.input = 'F'
    end 
  end 
end