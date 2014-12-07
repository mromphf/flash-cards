require_relative "quiz.rb"

class QuizFactory
  def self.generate_quiz(operation, difficulty)
    case operation
    when "add"
      return AdditionQuiz.new(difficulty, 0)
    when "sub"
      return SubtractionQuiz.new(difficulty, 0)
    when "mul"
      return MultiplicationQuiz.new(difficulty, 0)
    when "div"
      return DivisionQuiz.new(difficulty, 0)
    else
      raise "ERROR: could not generate a quiz with the arguments provided."
    end
  end
end
