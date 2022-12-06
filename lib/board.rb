class Board
    attr_accessor :positions
    def initialize
        @positions = []
    end

    def create_board
        42.times do
            @positions << '.'
        end
        row6 = @positions[35..41]
        row5 = @positions[28..34]
        row4 = @positions[21..27]
        row3 = @positions[14..20]
        row2 = @positions[7..13]
        row1 = @positions[0..6]
        all_rows = [row1, row2, row3, row4, row5, row6]
        @positions
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