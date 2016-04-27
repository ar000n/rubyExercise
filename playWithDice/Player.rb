class Player
  attr_accessor :playerName

  def initialize(playerName)
    @playerName = playerName
  end

  def roll_dice
    1 + rand(6)
  end
end

