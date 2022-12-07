class Computer
    attr_reader :input, :piece
    def initialize
        @input = nil
        @piece = "O"
    end

    def give_input
        valid_input = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
        @input = valid_input.sample
    end
end