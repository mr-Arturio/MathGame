# import other classes
require "./Player.rb"
require "./Question.rb"

# main logic of the game
class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @player_index = 0
    @current_player = @players[0]
  end

  def start_game
    loop do
      puts "--- New Turn ---"
      question = ask_question
      puts "#{@current_player.name}, here's your question: #{question.generate_question_text}"
      answer = gets.chomp.to_i

      if question.check_answer(answer)
        puts "Correct!"
      else
        puts "Wrong!!!"
        @current_player.decrease_lives
      end

      display_scores

      #he ? at the end of the method name conventionally indicates that the method returns a Boolean value
      if game_over?
        break
      end

      # switch_player
      if @player_index == 0
       @player_index = 1
      else 
        @player_index = 0
      end

      @current_player = @players[@player_index]
        


      # def announce_winner
      
    end
  end

  def ask_question
    Question.new
  end

  def display_scores
    @players.each do |player|
      puts "#{player.name}:Lives - #{player.lives}/3"
    end
  end

  def game_over? # '?' indicates that the method returns a Boolean value
    # 'any?' returns true if at least one element in the collection satisfies the condition
   @players.any? { |player| player.lives <= 0 }
     end


  
  # def announce_winner

  # end
end


game = Game.new("Player 1", "Player 2")
game.start_game