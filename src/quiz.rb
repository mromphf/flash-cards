require_relative "question.rb"
require_relative "config.rb"

class Quiz
  include GlobalConfig

  def initialize(difficulty, scores = [])
    @scores = scores
    @difficulty = difficulty
  end

  def size
    QUIZ_LENGTH
  end

  def display_score
    scoreboard = ""
    @scores.each { |correct| correct ? scoreboard << "." : scoreboard << "F" }
    scoreboard
  end
end

class AdditionQuiz < Quiz
  def get_random_question
    AdditionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    scores = @scores
    scores << question.correct_answer?(answer)
    AdditionQuiz.new(@difficulty, scores)
  end
end

class SubtractionQuiz < Quiz
  def get_random_question
    SubtractionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    scores = @scores
    scores << question.correct_answer?(answer)
    SubtractionQuiz.new(@difficulty, scores)
  end
end

class MultiplicationQuiz < Quiz
  def get_random_question
    MultiplicationQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    scores = @scores
    scores << question.correct_answer?(answer)
    MultiplicationQuiz.new(@difficulty, scores)
  end
end

class DivisionQuiz < Quiz
  def get_random_question
    DivisionQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    scores = @scores
    scores << question.correct_answer?(answer)
    DivisionQuiz.new(@difficulty, scores)
  end
end
