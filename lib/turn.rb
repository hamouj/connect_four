class Turn
    attr_reader :board, :player
    def initialize (player)
        @board = board
        @player = player
    end

    def valid_move?(input)
        if input == 'A'
            board['A'].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'B'
            board['B'].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'C'
            board['C'].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'D'
            board['D'].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'E'
            board['E'].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'F'
            board.all_columns[5].any? do |column|
                column.include?('.')
                'Invalid move' if false
            end 
        elsif input == 'G'
            board.all_columns[6].any? do |column|
                column.include?('.')                
                'Invalid move' if false
            end 
    end
end