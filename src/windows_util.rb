require 'curses'
require_relative 'config'

class WindowsUtil 
  include Curses
  include GlobalConfig

  def self.build_score_window
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 10, 30)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("Score:")
    win
  end

  def self.build_info_window
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 10, 70)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("Operation: foo")
    win.setpos(3, 3)
    win.addstr("Difficulty: bar")
    win
  end

  def self.build_question_window(question)
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 20, 50)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{question.to_s}")
    win
  end
end
