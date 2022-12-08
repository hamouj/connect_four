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

    def row_winner_check
        n = 0
        winner = 'No Winner Yet!'
        winner_array_checks = []
        until n == 6
            4.times do
                winner_array_checks << @rows[n].last(4)
                @rows[n].pop
            end
            n += 1
        end

        winner_array_checks.each do |array|
            if array == ['X', 'X', 'X', 'X']
                winner = player
                break
            elsif array == ["O", "O", "O", "O"]
                winner = computer
                break
            end
        end
        return winner
    end

    def column_winner_check
        winner = 'No Winner Yet!'
        winner_array_checks = []
        @board.each do |key, value|
            3.times do
                winner_array_checks << value.last(4)
                value.pop
            end
        end

        winner_array_checks.each do |array|
            if array == ['X', 'X', 'X', 'X']
                winner = player
                break
            elsif array == ["O", "O", "O", "O"]
                winner = computer
                break
            end
        end
        return winner
    end
end