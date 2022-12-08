class Player
    attr_reader :name, :piece
    attr_accessor :input
    def initialize(name)
        @name = name
        @input = nil
        @piece = 'X'
    end
    
    def valid_input?
        valid_inputs = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        if valid_inputs.include?(@input.upcase)
            true
        else
            p 'Typo? It happens to the best of us!'
            p 'Type the letter of the column you would like to play (A-G).'
        end
    end
end