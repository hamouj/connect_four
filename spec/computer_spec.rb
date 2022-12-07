require './lib/computer'

describe Computer do
    describe '#initialize' do
        it 'is an instance of the Computer class'do
            computer = Computer.new

            expect(computer).to be_a(Computer)
        end
    end
end