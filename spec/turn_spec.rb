require './lib/turn'
# require './lib/player'
# require './lib/board'

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
end
