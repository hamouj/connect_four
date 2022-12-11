class Turn
  attr_reader :board, :input

  def initialize (board)
    @board = board
    @input = nil
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
end