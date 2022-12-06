class Board
    attr_accessor :positions
    def initialize
        @positions = []
    end

    def board_positions
        puts 'A B C D E F G'
        42.times do
            @positions << '.'
        end
        @positions
    end

end