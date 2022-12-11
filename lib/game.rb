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
    p "#{@player.name}, you will be assigned the piece 'X'. Good luck!"
    puts "------------------------------------------------------"
    @board.create_board
    play_game
  end

  def play_game
    until @board.winner == @computer || @board.winner == @player || @board.full? == true
      player_move
      computer_move
    end
    end_game
  end

  def player_move 
    p 'Choose a column (A-G). Type the letter.'
      @board.show_board
      @player.input = gets.strip
      @player.valid_input?
      input = @player.input.upcase
      @turn.player_valid_move?(input)
      puts "------------------------------------------------------"
  end 

  def computer_move 
    p "Computer's move"
    @board.computer.give_input
    input = @board.computer.input
    @turn.computer_valid_move?(input)
  end 

  def end_game
    if @board.winner == @player
      p "#{@player.name} won--nice job!"
    elsif @board.winner == @computer
      p "Computer won this round."
    elsif @board.full? == true
      p "Draw!"
    end 
    play_again
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