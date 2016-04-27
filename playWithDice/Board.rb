require File.expand_path('../Player.rb', __FILE__)
class Board
  @@cells = {1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 8 => 'H', 9 => 'I', 10 => 'J', 11 => 'K', 12 => 'L', 13 => 'M', 14 => 'N', 15 => 'O', 16 => 'P'}
  @@gameRecord = Hash.new(0)

  def initialize(player)
    @player = player
    @gameStart = false
    @totalTurns= 0
    @currentPosition = -5
  end

  def moveTheCoin(number)
    @totalTurns+=1
    puts "the dice value is #{number}"
    if number == 6
      @gameStart = true
    end
    return "Need a 6 to start the journey...!!" if !@gameStart
    if (@currentPosition += number)>16
      @currentPosition-= number
    end
    puts @@cells[@currentPosition]
  end

  def play
    while @currentPosition <16 do
      puts moveTheCoin(@player.roll_dice)
      puts "current position is #{@currentPosition}"
    end
    @@gameRecord[@player.playerName] = @totalTurns
    puts "number of turns you took to finish  #{@totalTurns}"
  end

end
player1 = Player.new('suresh')
player2 = Player.new('ramesh')
board1 = Board.new(player1)
board2 = Board.new(player2)
board1.play
board2.play
puts Board.class_variable_get(:@@gameRecord)
