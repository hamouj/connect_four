require './lib/turn'
# require './lib/player'
# require './lib/board'
# require './lib/computer'

describe Turn do
    describe '#initialize' do
        it 'is an instance of the Turn class' do
            board = {
                'A' => ['X', 'O', 'O', 'X', 'O', 'X', 'O'],
                'B' => ['.', '.', '.', '.', '.', '.', '.'],
                'C' => ['.', '.', '.', '.', '.', '.', '.'],
                'D' => ['.', '.', '.', '.', '.', '.', '.'],
                'E' => ['.', '.', '.', '.', '.', '.', '.'],
                'F' => ['.', '.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.', '.']  
                }  
            
                turn = Turn.new('Ivan', board)

            expect(turn).to be_a(Turn)
        end
    end

    describe '#valid_move?' do
        it 'determines the move is valid' do
            board = {
                'A' => ['X', 'O', 'O', 'X', 'O', 'X', 'O'],
                'B' => ['.', '.', '.', '.', '.', '.', '.'],
                'C' => ['.', '.', '.', '.', '.', '.', '.'],
                'D' => ['.', '.', '.', '.', '.', '.', '.'],
                'E' => ['.', '.', '.', '.', '.', '.', '.'],
                'F' => ['.', '.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.', '.']  
                }  
            
            turn = Turn.new('Ivan', board)
            input = 'B'
            turn.valid_move?(input)
            
            expect(turn.valid_move?(input)).to eq('You are good to go!')
        end

        it 'determines the move is invalid' do
            board = {
            'A' => ['X', 'O', 'O', 'X', 'O', 'X', 'O'],
            'B' => ['.', '.', '.', '.', '.', '.', '.'],
            'C' => ['.', '.', '.', '.', '.', '.', '.'],
            'D' => ['.', '.', '.', '.', '.', '.', '.'],
            'E' => ['.', '.', '.', '.', '.', '.', '.'],
            'F' => ['.', '.', '.', '.', '.', '.', '.'],
            'G' => ['.', '.', '.', '.', '.', '.', '.']  
            }  
            turn = Turn.new('Ivan', board)
            input = 'A'
            turn.valid_move?(input)
            
            expect(turn.valid_move?(input)).to eq('That column is full. Choose a different column.')
        end 
    end

    describe '#place_piece methods' do
        it 'places an X in the chosen column for a person move' do
            board = {
                'A' => ['X', 'O', 'O', 'X', 'O', 'X', 'O'],
                'B' => ['.', '.', '.', '.', '.', '.', '.'],
                'C' => ['.', '.', '.', '.', '.', '.', '.'],
                'D' => ['.', '.', '.', '.', '.', '.', '.'],
                'E' => ['.', '.', '.', '.', '.', '.', '.'],
                'F' => ['.', '.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.', '.']  
                }  
                turn = Turn.new('Ivan', board)
                input = 'B'
                turn.valid_move?(input)
                turn.player_place_piece(input)

                expect(board['B'][0]).to eq('X')
        end

        it 'places an O in the chosen column for a computer move' do
            board = {
                'A' => ['X', 'O', 'O', 'X', 'O', 'X', 'O'],
                'B' => ['.', '.', '.', '.', '.', '.', '.'],
                'C' => ['.', '.', '.', '.', '.', '.', '.'],
                'D' => ['.', '.', '.', '.', '.', '.', '.'],
                'E' => ['.', '.', '.', '.', '.', '.', '.'],
                'F' => ['X', '.', '.', '.', '.', '.', '.'],
                'G' => ['.', '.', '.', '.', '.', '.', '.']  
                }  
                turn = Turn.new('Ivan', board)
                input = 'F'
                turn.valid_move?(input)
                turn.computer_place_piece(input)

                expect(board['F'][1]).to eq('O')
        end
    end
end
