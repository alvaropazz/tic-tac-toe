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
end
