class Board
    attr_accessor :board
    attr_reader :computer, :player, :rows

    def initialize(player)
        @computer = Computer.new
        @player = player
        @rows = []
    end

    def create_board
        @board = {
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
        all_positions = @board.values.flatten
        if all_positions.include?('.')
            false
        else
            true
        end
    end

    def print_board
        # Board prints in rows, so created an array of rows in the proccess
        puts "A B C D E F G"
        counter = 0
        6.times do
            row = []
            board.each do |key, value|
                print "#{value[counter]} "
                row << "#{value[counter]}"
            end
            puts "\n"
            counter += 1
        @rows << row
        end
    end

end