require './lib/turn'

describe Turn do
    describe '#initialize' do
        it 'is an instance of the Turn class' do
            # player = Player.new('Ivan')
            turn = Turn.new("Ivan")

            expect(turn).to be_a(Turn)
        end
    end
end
