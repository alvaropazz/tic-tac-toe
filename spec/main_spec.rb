# spec/main_spec.rb
require_relative '../bin/main.rb'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'creates a new instance variable "board" and creates an empty array with 9 spaces' do
      test_var = TicTacToe.new
      expect(test_var.instance_variable_get(:@board)).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
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

  describe 'play_board' do
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
end
