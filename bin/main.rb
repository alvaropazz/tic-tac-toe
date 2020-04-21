#!/usr/bin/env ruby
require_relative '../lib/gameboard.rb'
require_relative '../lib/gameplay.rb'

class TicTacToe
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def play_board(_board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def game
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    gameplay = GamePlay.new(@board)
    player_move(gameplay, @board) until gameplay.over?
    if gameplay.won?
      puts "The winner is #{gameplay.winner}!"
    elsif gameplay.draw?
      puts 'It\'s a draw!'
    end
  end

  def player_move(gameboard, _board)
    gameboard = GameBoard.new(@board)
    puts 'Enter a number from 1 to 9'
    space_number = gets.strip
    space = gameboard.selected_space(space_number)
    if gameboard.valid_input?(space) == true
      gameboard.play(space, gameboard.player)
      play_board(@board)
    else
      puts 'Invalid move'
      player_move(gameboard, @board)
    end
  end
end
