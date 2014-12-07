#!/usr/bin/ruby1.9.1 -w
require 'curses'
require_relative 'src/arg_utility'
require_relative 'src/input_utility'
require_relative 'src/windows_util'
require_relative 'src/quiz_factory'
include ArgUtility
include Curses

def take_quiz
  quiz = QuizFactory.generate_quiz(ARGV[0], ARGV[1])
  quiz.size.times do
    question = quiz.get_random_question
    WindowsUtil.refresh_windows(question)
    answer = WindowsUtil.build_answer_window
    quiz = quiz.answer_question(question, answer)
  end
  WindowsUtil.build_results_window(quiz.results)
end

def initialize_interface
  init_screen
  begin
    crmode
    take_quiz
  ensure
    close_screen
  end
end

if valid_args?(ARGV)
  initialize_interface
else
  puts usage_info
end
