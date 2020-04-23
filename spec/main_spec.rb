# spec/main_spec.rb
require_relative '../bin/main.rb'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'creates a new instance variable "board" and creates an empty array with 9 spaces' do
      test_var = TicTacToe.new
      expect(test_var.instance_variable_get(:@board)).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#play_board' do
    it 'prints a tic-tac-toe board' do
      def capture_puts
        $stdout = StringIO.new
        yield
        $stdout.string
      end

      board = %w[X X X X O O X O O]
      test_var = TicTacToe.new
      test_var.instance_variable_set(:@board, board)

      output = capture_puts { test_var.play_board }

      expect(output).to include(' X | X | X ')
      expect(output).to include('-----------')
      expect(output).to include(' X | O | O ')
      expect(output).to include('-----------')
      expect(output).to include(' X | O | O ')
    end
  end

  describe '#selected_space' do
    it 'converts the users input into an integer' do
      test_var = TicTacToe.new
      expect(test_var.selected_space('1')).to be_an(Integer)
    end
  end

  describe '#play' do
    it 'it assigns a space on the board to the player' do
      test_var = TicTacToe.new
      test_var.play(0, 'X')
      test_var.play(8, 'O')
      board = test_var.instance_variable_get(:@board)
      expect(board).to eq(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O'])
    end
  end

  describe '#empty_space?' do
    it 'tells the user whether or not a space is empty' do
      test_var = TicTacToe.new
      board = ['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      test_var.instance_variable_set(:@board, board)
      space = 0
      expect(test_var.empty_space?(space)).to be(true)
      space = 1
      expect(test_var.empty_space?(space)).to be(false)
    end
  end

  describe 'valid_input?' do
    it 'tells the user whether or not their input is valid within the game' do
      test_var = TicTacToe.new
      board = ['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      test_var.instance_variable_set(:@board, board)
      space = 0
      expect(test_var.valid_input?(space)).to be(false)
      space = 1
      expect(test_var.valid_input?(space)).to be(true)
    end
  end

  describe '#turn_counter' do
    it 'counts the number of turns the game has played' do
      test_var = TicTacToe.new
      board = ['X', 'O', 'X', 'O', ' ', ' ', ' ', ' ', ' ']
      test_var.instance_variable_set(:@board, board)
      expect(test_var.turn_counter).to eql(4)
    end
  end

  describe '#player' do
    it 'assigns X a turn if the turn_counter is even or zero' do
      test_var = TicTacToe.new
      board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      test_var.instance_variable_set(:@board, board)
      expect(test_var.player).to eq('X')
    end
  end

  describe '#game' do
    it 'asks the user to input a number from 1 to 9' do
      test_var = TicTacToe.new
      allow($stdout).to receive(:puts)
      allow(test_var).to receive(:over?).and_return(false, true)
      expect(test_var).to receive(:gets).at_least(:once).and_return('1')

      test_var.game
    end
  end

  describe '#player_move' do
    it 'asks the user for a move on the board' do
      test_var = TicTacToe.new
      allow($stdout).to receive(:puts)
      expect(test_var).to receive(:gets).and_return('1')

      test_var.player_move
    end

    it 'recieves the user\'s move and displays it in the board' do
      test_var = TicTacToe.new
      allow($stdout).to receive(:puts)
      expect(test_var).to receive(:gets).and_return('1')
      expect(test_var).to receive(:play_board)

      test_var.player_move

      board = test_var.instance_variable_get(:@board)
      expect(board).to eql(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe 'won?' do
    it 'alerts the game when a winning combination has been achieved' do
      test_var = TicTacToe.new
      board = %w[X X X O X O X O X]
      test_var.instance_variable_set(:@board, board)
      expect(test_var.won?).to match_array([0, 1, 2])
    end
  end

  describe '' do
    it '' do
    end
  end

  describe '' do
    it '' do
    end
  end

  describe '' do
    it '' do
    end
  end

  describe '' do
    it '' do
    end
  end
end
