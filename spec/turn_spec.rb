require './lib/turn'
require './lib/player'
require './lib/board'
require './lib/computer'

describe Turn do
    before(:each) do
        @player = Player.new('Ivan')
        @computer = Computer.new
    end 
    describe '#initialize' do
        it 'is an instance of the Turn class' do
            board = Board.new(@player)
            board.create_board
            turn = Turn.new(board)

            expect(turn).to be_a(Turn)
        end
    end

    describe '#valid_move?' do
        it 'determines the move is valid' do
            board = Board.new(@player)
            board.create_board
            turn = Turn.new(board)
            input = 'B'

            expect(turn.player_valid_move?(input)).to eq('Nice move!')
            expect(turn.computer_valid_move?(input)).to eq('End of computer turn.')
        end

        it 'determines the move is invalid' do
            board = Board.new(@player)
            board.create_board
            turn = Turn.new(board)
            board.board['A'] = ['X', 'X', 'X', 'O', 'O', 'X', 'O']
            input = 'A'
            
            expect(turn.player_valid_move?(input)).to eq('Uh-oh! That column is full. Choose another column.')
            expect(['A', 'B', 'C', 'D', 'E', 'F', 'G']).to include(turn.computer_valid_move?(input))
        end 
    end

    describe '#place_piece methods' do
        it 'places an X in the chosen column for a person move' do
            board = Board.new(@player)
            board.create_board
            turn = Turn.new(board)
               
            input = 'D'
            turn.player_valid_move?(input)

            expect(board.board['D'][5]).to eq('X')
        end

        it 'places an O in the chosen column for a computer move' do
            board = Board.new(@player)
            board.create_board
            turn = Turn.new(board)
            
            input = 'F'
            turn.computer_valid_move?(input)

            expect(board.board['F'][5]).to eq('O')
        end
    end
end
