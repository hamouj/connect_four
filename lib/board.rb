class Board
    attr_accessor :positions
    def initialize
        @positions = []
    end

    def create_board
        @positions = {
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
        if @positions.include?('.')
            false
        else 
            true
        end
    end

    def print_board
        create_board
        puts 'A B C D E F G'
        all_rows.each do |row|
            print row.join(" ") + "\n"
        end
    end

end