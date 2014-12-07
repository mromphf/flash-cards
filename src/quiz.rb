require_relative "question.rb"
require_relative "config.rb"

class Quiz
  include GlobalConfig

  def initialize(difficulty, score)
    @score = score
    @difficulty = difficulty
  end

  def size
    QUIZ_LENGTH
  end

  def give_feedback(question, answer)
    question.correct_answer?(answer) ? "Correct!" : "Wrong..."
  end

  def results
    "Final score: #{((@score.to_f / QUIZ_LENGTH.to_f) * 100).to_i}%"
  end
end

class AdditionQuiz < Quiz
  def get_random_question
    AdditionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    score = question.correct_answer?(answer) ? @score + 1 : @score
    AdditionQuiz.new(@difficulty, score)
  end
end

class SubtractionQuiz < Quiz
  def get_random_question
    SubtractionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    score = question.correct_answer?(answer) ? @score + 1 : @score
    SubtractionQuiz.new(@difficulty, score)
  end
end

class MultiplicationQuiz < Quiz
  def get_random_question
    MultiplicationQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    score = question.correct_answer?(answer) ? @score + 1 : @score
    MultiplicationQuiz.new(@difficulty, score)
  end
end

class DivisionQuiz < Quiz
  def get_random_question
    DivisionQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    score = question.correct_answer?(answer) ? @score + 1 : @score
    DivisionQuiz.new(@difficulty, score)
  end
end
