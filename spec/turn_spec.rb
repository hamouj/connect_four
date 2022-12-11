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
end
