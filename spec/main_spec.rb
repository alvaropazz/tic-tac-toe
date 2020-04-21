#spec/main_spec.rb
require_relative '../bin/main.rb'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'creates a new instance variable "board" and creates an empty array with 9 spaces' do
      test_var = TicTacToe.new
      expect(test_var.instance_variable_get(:@board)).to eq([" "," "," "," "," "," "," "," "," "])
    end
  end

  describe '#game' do
    it 'asks the user to input a number from 1 to 9' do
      test_var2 = TicTacToe.new
        allow($stdout).to receive(:puts)
        allow(test_var2).to receive(:over?).and_return(false, true)
        expect(test_var2).to receive(:gets).at_least(:once).and_return("1")

        test_var2.game
    end
  end
end
