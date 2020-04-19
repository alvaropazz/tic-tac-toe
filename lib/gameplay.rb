class GamePlay
  def won?
    COMBOS.detect do |combos_child|
      @board[combos_child[0]] == @board[combos_child[1]] &&
        @board[combos_child[1]] == @board[combos_child[2]] &&
        empty_space?(combos_child[0])
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
