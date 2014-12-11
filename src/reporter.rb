require_relative "../src/config.rb"
require 'curses'

class Reporter
  include GlobalConfig
  include Curses

  def initialize(report_lines = [], score = [])
    @lines = report_lines
    @scores = score
  end

  def header
    "Question\tSubmission\tAnswer"
  end

  def add_entry(question, answer)
    report_line = question.report_format(answer)
    correct = question.correct_answer?(answer)
    Reporter.new(@lines << report_line, @scores << correct)
  end

  def report_line(index)
    @lines[index].nil? ? "" : @lines[index]
  end

  def final_score
    score = 0
    @scores.each { |correct| score += 1 if correct }
    "Final Score: #{((score.to_f / QUIZ_LENGTH.to_f) * 100).to_i}%"
  end

  def build_results_window
    clear
    refresh
    win = Window.new(18, 45, 8, (cols - 45) / 2)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr(header)
    (1..QUIZ_LENGTH).each do |i|
      win.setpos(3 + i, 3)
      win.addstr(report_line(i))
    end
    win.setpos(14, 3)
    win.addstr(final_score)
    win.setpos(16, 3)
    win.addstr("Hit enter...")
    win.getch
  end
end
