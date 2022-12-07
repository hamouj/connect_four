class Turn
    attr_reader :board
    def initialize (board)
        @board = board
    end
    
    def player_valid_move?(input)
        column_has_space = board[input].any? do |column|
            column.include? ('.')
        end 
            if column_has_space == false
                'Uh-oh! That column is full. Choose another column.'
                player.input
            else
                'Nice move!'
                player_place_piece
            end     
    end 

    def computer_valid_move?(input)
        column_has_space = board[input].any? do |column|
            column.include? ('.')
        end 
            if column_has_space == false
                computer.give_input
            else
                computer_place_piece(input)
            end     
    end 

    def player_place_piece(input)
        board[input].find do |column|
            column.replace(player.piece) if column.include?('.')
        end

        board.print_board
    end

    def computer_place_piece(input)
        board[input].find do |column|
            column.replace(compuyter.piece) if column.include?('.')
        end
        
        board.print_board
    end
end