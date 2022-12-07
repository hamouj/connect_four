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
end