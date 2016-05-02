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


  def moveTheCoin number
    @totalTurns+=1
    puts "The dice value is #{number}"
    checkGameStart number
    return "Need a 6 to start the journey...!!" if !@gameStart
    determineGameStatus(number)
    puts @@cells[@currentPosition]
  end


  def play
    if @currentPosition <16
      puts moveTheCoin(@player.roll_dice)
      puts "current position is #{@currentPosition}\n"
    else
      puts("you won......!!")
      @@gameRecord[@player.playerName] = @totalTurns
      puts "number of turns you took to finish  #{@totalTurns}"

    end
  end

  private
  def determineGameStatus number
    check = (@currentPosition+=number) <=>16
    if check ==0
      puts "you won........!!"
    else
      if check == -1
        return @currentPosition
      else
        if check ==1
          return @currentPosition-=number
        end
      end
    end
  end

  def checkGameStart number
    if number == 6
      @gameStart = true
    end
  end

end


player1 = Player.new('suresh')
player2 = Player.new('ramesh')
board1 = Board.new(player1)
board2 = Board.new(player2)
while !(player1.gameStatus && player2.gameStatus) do
  puts("#{player1.playerName} 's turn\n Please roll the dice")
  board1.play
  puts("#{player2.playerName} 's turn\n Please roll the dice")
  board2.play
end