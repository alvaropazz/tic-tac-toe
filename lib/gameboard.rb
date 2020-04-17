class GameBoard
  def initialize(myboard)
    @board = myboard
  end

  def selected_space(space_number)
    space_number.to_i - 1
  end

  def empty_space?(space)
    @board[space] == 'X' || @board[space] == 'O' || !@board[space] == ' '
  end

  def valid_input?(space)
    space.between?(0, 8) && !empty_space?(space)
  end

  def play(space, player)
    @board[space] = player
  end

  def turn_counter
    counter = 0
    @board.each do |token|
      counter += 1 if %w[X O].include? token
    end
    counter
  end

  def player
    turn_counter.even? ? 'X' : 'O'
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
