class Player
	attr_reader :piece
	attr_accessor :input, :name

	def initialize(name)
		@name = name
		@input = nil
		@piece = 'X'
	end
    
	def valid_input?
		valid_inputs = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
		if valid_inputs.include?(@input.upcase)
			true
		elsif @input.upcase == 'EXIT'
			p 'See you later!'
			exit
			return 'See you later!'
		else
			p 'Typo? It happens to the best of us!'
			p 'Type the letter of the column you would like to play (A-G).'
		end
	end
end