#!/usr/bin/ruby1.9.1 -w
require 'curses'
require_relative 'src/arg_utility'
require_relative 'src/window_util'
require_relative 'src/quiz_factory'
require_relative 'src/reporter'
include Curses

class FlashCards
  include ArgUtility

  def main
    if valid_args?(ARGV)
      initialize_interface
    else
      puts usage_info
    end
  end

  private
    def take_quiz
      quiz = QuizFactory.generate_quiz(ARGV[0], ARGV[1])
      reporter = Reporter.new
      WindowUtil.build_score_window
      quiz.size.times do
        question = quiz.get_random_question
        WindowUtil.build_question_window(question)
        answer = WindowUtil.build_answer_window
        quiz = quiz.answer_question(question, answer)
        reporter = reporter.add_entry(question, answer)
        WindowUtil.build_score_window(quiz.display_score)
      end
      WindowUtil.build_results_window(reporter)
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
end

if $0 == __FILE__
  begin
    FlashCards.new.main
  rescue Interrupt
    exit(1)
  end
end
