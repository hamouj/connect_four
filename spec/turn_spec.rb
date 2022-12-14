require './lib/turn'
require './lib/player'
require './lib/board'
require './lib/computer'

describe Turn do
  before(:each) do
    @computer = Computer.new
    @player = Player.new('Ivan')
    @board = Board.new(@player, @computer)
  end 

  describe '#initialize' do
    it 'is an instance of the Turn class' do
      @board.create_board
      turn = Turn.new(@board)

      expect(turn).to be_a(Turn)
    end
  end
  
  describe '#column_space_check' do
    it 'determines there is space in the column' do
      @board.create_board
      turn = Turn.new(@board)
      input = 'B'
    
      expect(turn.column_space_check(input)).to be true
    end
    
    it 'determines there is not space in the colum' do 
      @board.create_board
      turn = Turn.new(@board)
      @board.board['A'] = ['X', 'X', 'X', 'O', 'O', 'X']
      input = 'A'

      expect(turn.column_space_check(input)).to be false
    end 
  end

  describe '#valid_move?' do
    it 'determines the move is valid' do
      @board.create_board
      turn = Turn.new(@board)
      input = 'B'
      turn.column_space_check(input)

      expect(turn.player_valid_move?).to eq('Nice move!')
      expect(turn.computer_valid_move?).to eq('End of computer turn.')
    end

    it 'determines the move is invalid' do
      @board.create_board
      turn = Turn.new(@board)
      @board.board['A'] = ['X', 'X', 'X', 'O', 'O', 'X']
      input = 'A'
      turn.column_space_check(input)

      expect(turn.player_valid_move?).to eq('Uh-oh! That column is full. Choose another column.')
      expect(turn.computer_valid_move?).to eq('Computer chooses another column.')
    end 
  end

  describe '#place_piece methods' do
    it 'places an X in the chosen column for a person move' do
      @board.create_board
      turn = Turn.new(@board)
               
      input = 'D'
      turn.column_space_check(input)
      turn.player_valid_move?

      expect(@board.board['D'][5]).to eq('X')
    end

    it 'places an O in the chosen column for a computer move' do
      @board.create_board
      turn = Turn.new(@board)
            
      input = 'F'
      turn.column_space_check(input)
      turn.computer_valid_move?

      expect(@board.board['F'][5]).to eq('O')
    end
  end

  describe 'Intelligent Computer' do
    it 'blocks a column win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', 'O', '.', 'O'],
				'C' => ['.', 'X', 'X', 'X', 'O', 'O'],
				'D' => ['.', '.', '.', '.', 'X', 'X'],
				'E' => ['.', '.', '.', '.', 'O', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      turn.intelligent_computer_move
      
      expect(@board.computer.input).to eq('C')
    end

    it 'blocks a row win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', '.', 'X'],
				'B' => ['.', '.', '.', 'O', 'X', 'O'],
				'C' => ['.', '.', '.', '.', 'X', 'O'],
				'D' => ['.', '.', '.', 'O', 'X', 'X'],
				'E' => ['.', '.', '.', 'X', 'O', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('A')
    end

    it 'blocks a diagonal win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', 'X', 'O', 'O'],
				'C' => ['.', 'O', 'X', 'X', 'X', 'O'],
				'D' => ['.', '.', '.', 'O', 'O', 'X'],
				'E' => ['.', '.', '.', 'X', 'O', 'X'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four 
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('A')
    end 

    it 'blocks a reverse diagonal win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', '.', 'O', 'X'],
				'C' => ['.', '.', '.', '.', 'X', 'O'],
				'D' => ['.', '.', '.', 'X', 'O', 'X'],
				'E' => ['.', '.', '.', 'X', 'O', 'X'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('E')
    end 

    it 'places a piece for a column win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', 'X', 'X', 'X'],
				'C' => ['.', 'O', 'O', 'O', 'X', 'O'],
				'D' => ['.', '.', '.', 'O', 'X', 'X'],
				'E' => ['.', '.', '.', '.', '.', 'X'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('C')
    end

    it 'places a piece for a row win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', 'X', 'O', 'X'],
				'C' => ['.', '.', 'O', 'O', 'X', 'O'],
				'D' => ['.', '.', '.', 'O', 'X', 'X'],
				'E' => ['.', '.', '.', 'O', 'X', 'X'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('F')
    end 

    it 'places a piece for a diagonal win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', 'X', 'O', 'X'],
				'C' => ['.', '.', 'O', 'O', 'X', 'O'],
				'D' => ['.', '.', '.', 'O', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'X', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('B')
    end 

    it 'places a piece for a reverse diagonal win' do
      turn = Turn.new(@board)
      @board.board = {
				'A' => ['.', '.', '.', '.', 'O', 'X'],
				'B' => ['.', '.', '.', '.', 'O', 'X'],
				'C' => ['.', '.', '.', '.', 'X', 'O'],
				'D' => ['.', '.', '.', 'X', 'O', 'X'],
				'E' => ['.', '.', '.', '.', 'X', 'O'],
				'F' => ['.', '.', '.', '.', '.', '.'],
				'G' => ['.', '.', '.', '.', '.', '.']
			}
    
      @board.show_board
      @board.show_board
      @board.winner
      @board.groups_of_four
      turn.intelligent_computer_move

      expect(@board.computer.input).to eq('E')
    end 
  end
end
