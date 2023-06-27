# Player class, here we have player name and number of lives + logic for decreasing lives

class Player 
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def decrease_lives
    @lives -= 1
  end
  
end