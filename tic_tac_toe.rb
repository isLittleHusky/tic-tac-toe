class Player
	def initialize(char, turn)
    @char = char
    @turn = turn
  end

  def turn?
    @turn
  end

  def char
    @char
  end

  def end_turn
    @turn = !@turn
  end
end

class Game
  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  end

  def run
    until check_win
      print_board
      play_round
      end_round
    end
    if players[0].char == check_win
      winner = 1
    else
      winner = 2
    end
    puts "Player #{winner} is the victor!"
  end

  private
    def print_board
      for i in 0..2
        for ii in 0..2
          if ii == 1 || ii == 2
            print "|"
          end 
          print @board[i][ii] 
        end
        print "\n"
        if i == 0 or i == 1
          puts "-----"
        end
      end
    end

    def play_round
      if @players[0].turn?
        player = 0
      else
        player = 1
      end
      puts "Player #{player + 1} it's your turn."
      until [0, 1, 2].include?(row)
        puts "Which row would you like to play in? (1-3)"
        row = gets.chomp.to_i - 1
        if ![0, 1, 2].include?(row)
          puts "Try entering a number from 1-3"
        end
      end
      until [0, 1, 2].include?(col)
        puts "Which column would you like to play in? (1-3)"
        col = gets.chomp.to_i - 1
        if ![0, 1, 2].include?(col)
          puts "Try entering a number from 1-3"
        end
      end
      if @board[row][col] == " "
        @board[row][col] = @players[player].char
      else
        puts "Looks like that spot is taken"
        play_round
      end
    end

    def check_win #checks if a player has won and returns their character, else returns false
      for i in 0..2
        unless @board[i][0] == " "
          if @board[i][0] == @board[i][1] == @board[i][2]
            return @board[i][0]
          end
        end
        unless @board[0][i] == " "
          if @board[0][i] == @board[1][i] == @board[2][i]
            return @board[0][i]
          end  
        end
      end
      false
    end

    def end_round
      players.each {|player| player.end_turn}
    end


end