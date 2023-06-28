# import other classes
require "./Player.rb"
require "./Question.rb"

# main logic of the game
class Game
  def initialize
    @players = []

    @current_player = @players.first
  end

  def start_game
    puts "--- New Turn ---"
    question = generate_question
    puts "#{current_player.name}, here's your question: #{question.generate_question_text}"
    answer = gets.chomp.to_i
  end

  def ask_question
    Question.new
  end

  # def display_score

  # end

  # def switch_player

  # end

  # def game_over

  # end

  # def announce_winner

  # end
end

=begin
1. ask question for player1
   - question from Question file 
   - user answer gets.chomp
   - we need to check if the answer is correct
   - if not decrease lives
   -display score for both
2. switch player
3.another player logic same as p1

4. logic for the end gtame if lives less than 1
5. anounce winner

=end

game = Game.new
game.start_game
