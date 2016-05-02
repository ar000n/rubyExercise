class Player
attr_accessor :playerName,:gameStatus

  def initialize(playerName)
    @gameStatus = false
    @playerName = playerName
  end


  def roll_dice
    flag = gets
    if flag
      flag = false
      1 + rand(6)
    end
  end
end

