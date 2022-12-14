class Turn
  attr_reader :board, 
              :input, 
              :computer_win, 
              :computer_block

  def initialize (board)
    @board = board
    @input = nil
    @computer_win = []
    @computer_block = []
  end

  def column_space_check(input)
    @input = input
		exit if @input.upcase == 'EXIT'
    board.board[@input].any? do |column|
      column.include?('.')
    end
  end

  def player_valid_move?
    if column_space_check(input) == false
      return 'Uh-oh! That column is full. Choose another column.'
    else
      player_place_piece
    end     
  end 

  def computer_valid_move?
    @input = input
    if column_space_check(input) == false
      return 'Computer chooses another column.'
    else
      computer_place_piece
    end     
  end 

  def player_place_piece
    board.board[@input].reverse.find do |column|
    column.replace(board.player.piece) if column.include?('.')
    end
    player__turn_message
  end

  def player__turn_message
    puts '------------------------------------------------------'
    p "Your move"
    board.show_board
    return 'Nice move!'
  end

  def computer_place_piece
    board.board[@input].reverse.find do |column|
    column.replace(board.computer.piece) if column.include?('.')
    end
    computer_turn_message
  end

  def computer_turn_message
    board.show_board
    puts '------------------------------------------------------'
    return 'End of computer turn.'
  end

  # Start of intelligent computer
  def intelligent_computer_win
    @computer_win.push(board.computer_column_win)
    @computer_win.push(board.left_win_check)
    @computer_win.push(board.right_win_check)
    @computer_win.compact!
  end 

  def intelligent_computer_block
    @computer_block.push(board.computer_column_block)
    @computer_block.push(board.left_block_check)
    @computer_block.push(board.right_block_check)
    @computer_block.compact!
  end 
  
  def intelligent_computer_move
    intelligent_computer_win
    intelligent_computer_block
    if !@computer_win.empty?
      board.computer.input = @computer_win.first
    elsif !@computer_block.empty?
      board.computer.input = @computer_block.first
    else
      board.computer.give_input 
    end
    clear_computer_turn
  end 

  def clear_computer_turn
    @computer_win.clear
    @computer_block.clear
    board.all_arrays.clear
    board.column_block.clear
    board.column_win.clear
    board.l_block_index = nil
    board.r_block_index = nil
    board.l_win_index = nil
    board.r_win_index = nil 
  end
end