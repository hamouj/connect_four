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
        winner_array_checks = []
        until n == 6
            4.times do
                winner_array_checks << @rows[n].last(4)
                @rows[n].pop
            end
            n += 1
        end

        check_array_for_winner(winner_array_checks)
    end

    def column_winner_check
        winner_array_checks = []
        @board.each do |key, value|
            3.times do
                winner_array_checks << value.last(4)
                value.pop
            end
        end
        check_array_for_winner(winner_array_checks)
    end

    def diagonal_winner_check
        winner_array_checks = []
        reverse_diagonals = @board.map {|key, value| value.reverse}
        winner_array_checks.concat(diagonal_arrays(@board.values))
        winner_array_checks.concat(diagonal_arrays(reverse_diagonals))
        check_array_for_winner(winner_array_checks)
    end

    def check_array_for_winner(array)
        winner = 'No Winner Yet'
        array.each do |array|
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

    def diagonal_arrays(array)
        i = 0
        n = 3
        temp = []
        until n == 6
            temp << (i..n).collect {|i| array[i][i]}
            temp << (i..n).collect {|i| array[i+1][i]}
            temp << (i..n).collect {|i| array[i][i+1]}
            i += 1
            n += 1
        end
    
        i = 0
        n = 1
        temp << (i..3).collect {|i| array[i][n+=1]}
    
        i = 0
        n = 3
        2.times do
            temp << (i..n).collect {|i| array[i+2][i]}
            i += 1
            n += 1
        end
    
        i = 0
        n = -1
        temp << (i..3).collect {|i| array[i+3][n+=1]}
    
        temp.delete_if {|n| n.include?(nil)}
        return temp
    end

    def winner
        column_winner_check
        row_winner_check
    end
end