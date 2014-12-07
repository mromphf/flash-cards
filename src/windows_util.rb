require 'curses'
require_relative 'config'

WINDOW_HEIGHT = 5
WINDOW_LENGTH = 35

class WindowsUtil 
  include Curses
  include GlobalConfig

  def self.build_results_window(results)
    clear
    refresh
    win = Window.new(WINDOW_HEIGHT + 1, WINDOW_LENGTH, 8, (cols - WINDOW_LENGTH) / 2)

    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{results}")
    win.setpos(3, 3)
    win.addstr("Hit any key...")
    win.getch
  end

  def self.build_score_window(score = "")
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 7, (cols - WINDOW_LENGTH) / 2)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("Score: #{score}")
    win.refresh
  end

  def self.build_question_window(question)
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 14, (cols - WINDOW_LENGTH) / 2)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{question.to_s}")
    win.refresh
  end

  def self.build_answer_window
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 21, (cols - WINDOW_LENGTH) / 2)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("ANSWER: ")
    win.getstr.to_i
  end
end
