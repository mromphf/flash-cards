require_relative "quiz.rb"

class QuizFactory
  def self.generate_quiz(operation, difficulty)
    case operation
    when "add"
      return AdditionQuiz.new(difficulty)
    when "sub"
      return SubtractionQuiz.new(difficulty)
    when "mul"
      return MultiplicationQuiz.new(difficulty)
    when "div"
      return DivisionQuiz.new(difficulty)
    else
      raise "ERROR: could not generate a quiz with the arguments provided."
    end
  end
end
