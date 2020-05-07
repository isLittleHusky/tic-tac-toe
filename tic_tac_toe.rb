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
    players = [player_one, player_two]
    board = [["", "", ""], ["". "", ""], ["", "", ""]]
  end

  def run

  end

  private
    def check_win
      @board.each do |row|
        unless row[0] == ""
          if row[0] == row[1] == row[2]
            return row[0]
          end
        end
      end
      
    end
end