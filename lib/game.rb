class Game
    attr_reader :computer, :board, :turn
    attr_accessor :player

    def initialize
        @player = Player.new('name')
        @board = Board.new(@player)
        @turn = Turn.new(@board)
    end
    
    def start
        p 'Welcome to Connect Four.'
        p 'Enter p to play. Enter q to quit.'

        begin_game = gets.strip
        if begin_game.downcase == 'p'
            instructions
        else
            exit
        end 
    end

    def instructions
        puts "------------------------------------------------------"
        p "Lets play! First, what is your name?"
        player.name = gets.strip
        puts "------------------------------------------------------"
        p "#{player.name}, you will be assigned the piece 'X'. Good luck!"
        puts "------------------------------------------------------"
        board.create_board
        play_game
    end

    def play_game
        p 'Choose a column (A-G). Type the letter.'
        board.print_board
        player.input = gets.strip
        until player.valid_input? == true
            player.input = gets.strip
        end
        input = player.input.upcase
        turn.player_valid_move?(input)
        puts "------------------------------------------------------"
        p "Computer's move"
        board.computer.give_input
        input = board.computer.input
        turn.computer_valid_move?(input)
        end
    end

end 