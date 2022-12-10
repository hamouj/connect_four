require './lib/computer'

describe Computer do
	describe '#initialize' do
		it 'is an instance of the Computer class'do
			computer = Computer.new

			expect(computer).to be_a(Computer)
		end
	end

	describe '#give_input' do
		it 'generates input' do
			computer = Computer.new

			expect(['A', 'B', 'C', 'D', 'E', 'F', 'G']). to include(computer.give_input)
		end
	end
end