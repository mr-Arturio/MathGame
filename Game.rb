# import other classes
require "./Player.rb"
require "./Question.rb"

# main logic of the game
class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @player_index = 0
    @current_player = @players[@player_index]
  end

  def start_game # main entry point for the game
    loop do # loop that continues until the game is over
      puts "--- New Turn ---"
      question = ask_question
      puts "#{@current_player.name}, here's your question: #{question.generate_question_text}"
      answer = gets.chomp.to_i # gets the answer from the current player

      if question.check_answer(answer)
        puts "Correct!"
      else
        puts "Wrong!!!"
        @current_player.decrease_lives
      end

      display_scores

      #'?'' at the end of the method name conventionally indicates that the method returns a Boolean value
      break if game_over?

      switch_player
    end

    announce_winner
  end


  def ask_question
    Question.new
  end

  def display_scores
    @players.each do |player| #loop over each player and prints the info
      puts "#{player.name}: Lives - #{player.lives}/3"
    end
  end

  def game_over? # '?' indicates that the method returns a Boolean value
    # 'any?' returns true if at least one element in the collection satisfies the condition
    @players.any? { |player| player.lives <= 0 }
  end

  def switch_player #updates the player index
    @player_index = (@player_index + 1) % @players.length
    @current_player = @players[@player_index] # updates the @current_player variable accordingly.
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }

    puts "Game Over!"
    puts "#{winner.name} wins with a score of #{winner.lives}/3."
  end
end
