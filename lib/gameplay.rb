class GamePlay
  def initialize(myboard)
    @board = myboard
  end

  COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def won?
    gameboard = GameBoard.new(@board)
    COMBOS.detect do |combos_child|
      @board[combos_child[0]] == @board[combos_child[1]] &&
        @board[combos_child[1]] == @board[combos_child[2]] &&
        gameboard.empty_space?(combos_child[0])
    end
  end

  def full_board?
    @board.all? { |space| %w[X O].include? space }
  end

  def draw?
    full_board? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?[0]] if won?
  end
end
