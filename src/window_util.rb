require 'curses'
require_relative 'config'

class WindowUtil 
  include GlobalConfig
  include Curses

  WINDOW_HEIGHT = 5
  WINDOW_LENGTH = 35

  def self.build_results_window(reporter, results)
    clear
    refresh
    win = Window.new(18, 45, 8, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{reporter.header}")
    (1..QUIZ_LENGTH).each do |i|
      win.setpos(3 + i, 3)
      win.addstr("#{reporter.report_line(i)}")
    end
    win.setpos(14, 3)
    win.addstr(results)
    win.setpos(16, 3)
    win.addstr("Hit enter...")
    win.getch
  end

  def self.build_score_window(score = "")
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 7, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("Score: #{score}")
    win.refresh
  end

  def self.build_question_window(question)
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 14, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{question.to_s}")
    win.refresh
  end

  def self.build_answer_window
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 21, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("ANSWER: ")
    win.getstr.to_i
  end

  private
    def self.screen_center
      (cols - WINDOW_LENGTH) / 2
    end
end
