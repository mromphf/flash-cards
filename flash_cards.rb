#!/usr/bin/ruby1.9.1 -w
require_relative 'src/arg_utility'
require_relative 'src/input_utility'
require_relative 'src/quiz_factory'
include ArgUtility

def take_quiz 
  quiz = QuizFactory.generate_quiz(ARGV[0], ARGV[1])
  while quiz.running?
    question = quiz.get_random_question
    answer = InputUtility.get_user_int(question.to_s)
    puts quiz.give_feedback(question, answer)
    quiz.answer_question!(question, answer)
  end
  puts quiz.results
end

if valid_args?(ARGV)
  take_quiz
else
  puts usage_info
end
