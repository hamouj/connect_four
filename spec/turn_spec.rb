require './lib/turn'
require './lib/player'
require './lib/board'
require './lib/computer'

describe Turn do
    before(:each) do
        @player = Player.new('Ivan')
        @computer = Computer.new
        @board = Board.new(@player, @computer)
        @turn = Turn.new(@board)
    describe '#initialize' do
        it 'is an instance of the Turn class' do

            expect(turn).to be_a(Turn)
        end
    end

    describe '#valid_move?' do
        it 'determines the move is valid' do

            input = 'B'
            turn.player_valid_move?(input)
            
            expect(turn.player_valid_move?(input)).to include('Nice move!')
        end

        it 'determines the move is invalid' do

            input = 'A'
            turn.valid_move?(input)
            
            expect(turn.valid_move?(input)).to include('Uh-oh! That column is full. Choose another column.')
        end 
    end

    describe '#place_piece methods' do
        it 'places an X in the chosen column for a person move' do
    
                input = 'B'
                turn.valid_move?(input)
                turn.player_place_piece(input)

                expect(board['B'][0]).to eq('X')
        end

        it 'places an O in the chosen column for a computer move' do

                input = 'F'
                turn.valid_move?(input)
                turn.computer_place_piece(input)

                expect(board['F'][1]).to eq('O')
        end
    end
end
