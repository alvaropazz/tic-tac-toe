class Player
  attr_accesor :name, :piece
  def initialize (name = "Random Player", piece, board)
    @name = name
    @piece = piece
    @board = board
  end
end