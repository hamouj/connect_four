class Turn
    attr_reader :board

    def initialize (board)
        @board = board
        @input = nil
    end

    def player_valid_move?(input)
        @input = input
        column_has_space = board.board[input].any? do |column|
            column.include? ('.')
        end 
            if column_has_space == false
                p 'Uh-oh! That column is full. Choose another column.'
                board.player.input
                return 'Uh-oh! That column is full. Choose another column.'
            else
                player_place_piece
            end     
    end 

    def computer_valid_move?(input)
        @input = input
        column_has_space = board.board[input].any? do |column|
            column.include? ('.')
        end 
            if column_has_space == false
                board.computer.give_input
            else
                computer_place_piece
            end     
    end 

    def player_place_piece
        board.board[@input].reverse.find do |column|
            column.replace(board.player.piece) if column.include?('.')
        end

        board.print_board
        return 'Nice move!'
    end

    def computer_place_piece
        board.board[@input].reverse.find do |column|
            column.replace(board.computer.piece) if column.include?('.')
        end
        
        board.print_board
        return 'End of computer turn.'
    end
end