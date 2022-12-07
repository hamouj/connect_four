class Board
    attr_accessor :board_columns
    
    def initialize
        @board_columns = []
    end

    def create_board
        @board_columns = {
            'A' => ['.', '.', '.', '.', '.', '.'],
            'B' => ['.', '.', '.', '.', '.', '.'],
            'C' => ['.', '.', '.', '.', '.', '.'],
            'D' => ['.', '.', '.', '.', '.', '.'],
            'E' => ['.', '.', '.', '.', '.', '.'],
            'F' => ['.', '.', '.', '.', '.', '.'],
            'G' => ['.', '.', '.', '.', '.', '.']
        }
    end

    def full?
        full = false
        for column in @board_columns.values
            if full == true
                break
            else
                full = column.none? {|n| '.' == n}
            end
        end
        return full
    end

    def print_board
        create_board
        puts 'A B C D E F G'
        all_rows.each do |row|
            print row.join(" ") + "\n"
        end
    end

end