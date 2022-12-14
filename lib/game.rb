class Game
  def initialize
    @computer = Computer.new
    @player = Player.new('name')
    @board = Board.new(@player, @computer)
    @turn = Turn.new(@board)
  end 

  def start
    p 'Welcome to Connect Four.'
    p 'Enter p to play. Enter q to quit.'
    begin_game = 'test'
    until begin_game.downcase == 'p' || begin_game.downcase == 'q'
      begin_game_messages
    end 
  end

  def begin_game_messages
    begin_game = gets.strip
    if begin_game.downcase == 'p'
      puts "------------------------------------------------------"
      get_player_name
      instructions
    elsif begin_game.downcase == 'q'
      p "Hope to see you soon--bye!"
      exit
      return "Hope to see you soon--bye!"
    else
      p "Didn't catch that. If you want to play, type 'p', otherwise type 'q'."
    end 
  end

  def get_player_name
    p "Lets play! First, what is your name?"
    @player.name = gets.strip
    puts "------------------------------------------------------"
  end

  def instructions
    p "#{@player.name}, you will be assigned the piece 'X'."
    p "At any point in time, type 'exit' to exit the game. Good luck!"
    puts "------------------------------------------------------"
    @board.create_board
    play_game
  end

  def play_game
    game_winner = @board.winner
    until game_winner == @computer || game_winner == @player || @board.full? == true
      @board.rows.clear
      player_move
      computer_move
      game_winner = @board.winner
    end
    end_game
  end

  def player_move 
    p 'Choose a column (A-G). Type the letter.'
    @board.show_board
    valid_input_check
    valid_move_check
    puts "------------------------------------------------------"
  end 

  def valid_input_check
    @player.input = gets.strip
    until @player.valid_input? == true
      @player.input = gets.strip
    end 
  end 

  def valid_move_check
    input = @player.input.upcase
    until @turn.column_space_check(input) == true
      p 'Uh-oh! That column is full. Choose another column.'
      @player.input = gets.strip
      input = @player.input.upcase
    end 
    @turn.player_valid_move?
  end

  def computer_move 
    p "Computer's move"
    @board.groups_of_four
    @turn.intelligent_computer_move
    input = @board.computer.input
    until @turn.column_space_check(input) == true
      @board.computer.give_input
      input = @board.computer.input
    end
    @turn.computer_valid_move?
  end 

  def end_game
    if @board.winner == @player
      p "#{@player.name} won--nice job!"
    elsif @board.winner == @computer
      p "Computer won this round."
    elsif @board.full? == true
      p "Draw!"
    end 
    clear_all
    play_again
  end 

  def clear_all
    @turn.computer_win.clear
    @turn.computer_block.clear
    @board.all_arrays.clear
    @board.column_block.clear
    @board.column_win.clear
    @board.rows.clear
    @board.temp_array.clear
    @board.l_block_index = nil
    @board.r_block_index = nil
    @board.l_win_index = nil
    @board.r_win_index = nil 
  end 

  def play_again
    p "Would you like to play again? Type 'yes' or 'no'."
    answer = 'test'
    until answer.downcase == 'yes' || answer.downcase == 'no' 
      play_again_messages
    end    
  end 

  def play_again_messages
    answer = gets.strip
    if answer.downcase == 'yes'
      instructions
    elsif answer.downcase =='no'
      p 'See you next time!'
      exit
    else 
      p "Didn't catch that. Enter 'yes' or 'no'."
    end
  end 
end 