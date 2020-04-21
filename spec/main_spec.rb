#spec/main_spec.rb
require_relative '../bin/main.rb'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it 'creates a new instance variable "board" and creates an empty array with 9 spaces' do
      test_var = TicTacToe.new
      expect(test_var.instance_variable_get(:@board)).to eq([" "," "," "," "," "," "," "," "," "])
    end
  end
end

