# here we have logic for single question, and check if the answer is correct

class Question
  attr_reader :num1, :num2, :correct_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correct_answer = num1 + num2
  end

  def generate_question_text
    "What is the sum of #{num1} and #{num2}?"
  end

  def check_answer(answer)
    answer == correct_answer
  end

 end
