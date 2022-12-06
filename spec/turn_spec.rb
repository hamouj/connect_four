require './lib/turn'

describe Turn do
    describe '#initialize' do
        it 'is an instance of the Turn class' do
            # player = Player.new('Ivan')
            turn = Turn.new('Ivan')

            expect(turn).to be_a(Turn)
        end
    end

    describe '#valid_move?' do
        it 'determines the move is valid' do
            # player = Player.new('Ivan')
            turn = Turn.new('Ivan')
            input = "B"
            turn.valid_move?(input)

            expect(turn.valid_move?).to be true
        end

        it 'determines the move is invalid' do
             # player = Player.new('Ivan')
            turn = Turn.new('Ivan')
            # input = 
            turn.valid_move?(input)
            
            expect(turn.valid_move?).to eq('Invalid move')
        end 
end
