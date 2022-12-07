class Turn
    attr_reader :player, :computer, :board
    def initialize (player, board)
        @player = player
        @computer = computer
        @board = board
    end
    
    def valid_move?(input)
        column_space = board[input].any? do |column|
            column.include? ('.')
        end 
            if column_space == false
                'That column is full. Choose a different column.'
            else
                'You are good to go!'
            end     
    end 

    def player_place_piece(input)
        board[input].find do |column|
            column.replace('X') if column.include?('.')
        end
    end

    def computer_place_piece(input)
        board[input].find do |column|
            column.replace('O') if column.include?('.')
        end
    end
end