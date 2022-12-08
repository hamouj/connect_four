class Game
    attr_reader :computer, :board, :turn
    attr_accessor :plyaer

    def initialize
        @computer = Computer.new
        @player = Player.new('name')
        @board = Board.new(@player)
        @turn = Turn.new(@board)
    end
    
    def start
        p 'Welcome to Connect Four.'
        p 'Enter p to play. Enter q to quit.'

        begin_game = gets.strip
        if begin_game.downcase == 'p'
            turn
        else
            exit
        end 
    end


end 