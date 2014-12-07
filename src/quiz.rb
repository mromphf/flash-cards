require_relative "question.rb"
require_relative "config.rb"

class Quiz
  include GlobalConfig

  def initialize(difficulty, score = [])
    @score = score
    @difficulty = difficulty
  end

  def size
    QUIZ_LENGTH
  end

  def display_score
    scoreboard = ""
    @score.each { |b| b ? scoreboard << "." : scoreboard << "F" }
    scoreboard
  end

  def give_feedback(question, answer)
    question.correct_answer?(answer) ? "Correct!" : "Wrong..."
  end

  def results
    correct_answers = 0
    @score.each { |b| correct_answers += 1 if b }
    "Final score: #{((correct_answers.to_f / QUIZ_LENGTH.to_f) * 100).to_i}%"
  end
end

class AdditionQuiz < Quiz
  def get_random_question
    AdditionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    score = @score
    score << question.correct_answer?(answer) ? true : false
    AdditionQuiz.new(@difficulty, score)
  end
end

class SubtractionQuiz < Quiz
  def get_random_question
    SubtractionQuestion.get_random_question(@difficulty)
  end
  
  def answer_question(question, answer)
    score = @score
    score << question.correct_answer?(answer) ? true : false
    SubtractionQuiz.new(@difficulty, score)
  end
end

class MultiplicationQuiz < Quiz
  def get_random_question
    MultiplicationQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    score = @score
    score << question.correct_answer?(answer) ? true : false
    MultiplicationQuiz.new(@difficulty, score)
  end
end

class DivisionQuiz < Quiz
  def get_random_question
    DivisionQuestion.get_random_question(@difficulty)
  end

  def answer_question(question, answer)
    score = @score
    score << question.correct_answer?(answer) ? true : false
    DivisionQuiz.new(@difficulty, score)
  end
end
