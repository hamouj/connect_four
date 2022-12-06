class Board
    attr_accessor :positions
    def initialize
        @positions = []
    end

    def create_board
        puts 'A B C D E F G'
        42.times do
            @positions << '.'
        end
        @positions
    end

    def full?
        if @positions.include?('.')
            false
        else 
            true
        end
    end

end