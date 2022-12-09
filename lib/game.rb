class Game
    attr_reader :computer, :board, :turn
    attr_accessor :player

    def initialize
        @computer = Computer.new
        @player = Player.new('name')
        @board = Board.new(@player, @computer)
        @turn = Turn.new(@board)
    end
    
    def start
        p 'Welcome to Connect Four.'
        p 'Enter p to play. Enter q to quit.'

        begin_game = gets.strip
        if begin_game.downcase == 'p'
            puts "------------------------------------------------------"
            p "Lets play! First, what is your name?"
            player.name = gets.strip
            puts "------------------------------------------------------"
            instructions
        else
            exit
        end 
    end

    def instructions
        p "#{player.name}, you will be assigned the piece 'X'. Good luck!"
        puts "------------------------------------------------------"
        board.create_board
        play_game
    end

    def play_game
       until board.winner == computer || board.winner == player || board.full? == true
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
            end_game
    end

    def end_game
        if board.winner == player
            p "#{player.name} won--nice job!"
        elsif board.winner == computer
            p "Computer won this round."
        elsif board.full? == true
            p "Draw!"
        end 
        play_again?
    end 

    def play_again
        p "Would you like to play again? Type 'yes' or 'no'."
        answer = 'j'
        until answer.downcase == 'yes' || answer.downcase == 'no' 
            answer = gets.strip
            if answer.downcase == 'yes'
                instructions
            elsif answer.downcase =='no'
                exit
            else 
                p "Didn't get that. Enter 'yes' or 'no'."
            end
        end    
    end 
end 