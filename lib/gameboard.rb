class GameBoard
  def initialize(myboard)
   @board = myboard
  end

  # define which space within the board is selected
  # input is converted into a integer and substracted one so
  # that it matches the number of indexes
  def selected_space(space_number)
    space_number.to_i - 1
  end

  # define a method to validate whether or not a space in the board is already taken
  def empty_space?(space)
    @board[space] == 'X' || @board[space] == 'O' || !@board[space] == ' '
  end

  # define a method to check whether or not an user's input is valid i.e. that it corresponds to one of
  # the spaces in the board, and that it is not occupying an already used space

  def valid_input?(space)
    space.between?(0, 8) && !empty_space?(space)
  end

  # define which space in the board is taken depending on the user's input
  def play(space, player)
    @board[space] = player
  end

  # define a method to count the number of turns that've been taken, this is a helper method for the
  # *player* method that'll evaluate which token's turn is to be played when the *game* method is running
  def turn_counter
    counter = 0
    @board.each do |token|
      counter += 1 if %w[X O].include? token
    end
    counter
  end

  # use turn_counter to define the current_player method
  def player
    turn_counter.even? ? 'X' : 'O'
  end

  # 8 winning combinations, 3 horizontal, 3 vertical and 2 diagonal
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

  # for this method we need to check if the child arrays of the COMBOS array contain the same token
  # inside of each of their spaces, i.e. that the space occupied by the first position of the child array
  # contains the same token as the space occupied by the second position of the child
  # array, and that the third position's space mathces the two ones. additionally the method will
  # check with the *empty_space?* method to determine if a space is not empty and that is
  # using the token used in the three positions of the child array
  # we'll use the *detect* enumerable method. this method outputs the first entry on our enumerable for which the
  # block conditions are true. in this case that position[0]== position[1] && position[1] == position[2] &&
  # empty_space?(position[0])
  def won?
    COMBOS.detect do |combos_child|
      @board[combos_child[0]] == @board[combos_child[1]] &&
        @board[combos_child[1]] == @board[combos_child[2]] &&
        empty_space?(combos_child[0])
    end
  end

  # this method will check whether or not all the board's spaces are already filled up
  # it'll use the enumerable method *all?*
  def full_board?
    @board.all? { |space| %w[X O].include? space }
  end

  # the *draw?* method builds on top of the *won?* and *full_board?* methods
  def draw?
    full_board? && !won?
  end

  # the *over?* method builds on top of the *won?* and *draw?* methods
  def over?
    won? || draw?
  end

  # the *winner* method builds on top of the *won?* method and outputs
  # the first element of the winner array selected by the *won?* method when
  # the *won?* method is true
  def winner
    @board[won?[0]] if won?
  end
end
