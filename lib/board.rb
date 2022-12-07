class Board
    attr_accessor :board
    attr_reader :computer, :player

    def initialize(player)
        @computer = Computer.new
        @player = player
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
        puts "A B C D E F G"
        counter = 0
        6.times do
            board.each do |key, value|
                print "#{value[counter]} "
            end
            puts "\n"
            counter += 1
        end
    end

end