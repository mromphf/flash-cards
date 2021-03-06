require 'curses'
require_relative 'config'

class WindowUtil 
  include GlobalConfig
  include Curses

  WINDOW_HEIGHT = 5
  WINDOW_LENGTH = 35

  def self.build_score_window(score = "")
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 
                     self.top_ten_percent, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("Score: #{score}")
    win.refresh
  end

  def self.build_question_window(question)
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 
                     self.top_ten_percent + 7, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{question.to_s}")
    win.refresh
  end

  def self.build_answer_window
    win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, 
                     self.top_ten_percent + 14, self.screen_center)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("ANSWER: ")
    win.getstr.chomp.to_i
  end

  def self.build_results_window(reporter)
    clear
    refresh
    win = Window.new(19, 45, self.top_ten_percent, (cols - 45) / 2)
    win.box(?|, ?-)
    win.setpos(2, 3)
    win.addstr("#{reporter.header}")
    (0..(QUIZ_LENGTH - 1)).each do |i|
      win.setpos(4 + i, 3)
      win.addstr("#{reporter.report_line(i)}")
    end
    win.setpos(15, 3)
    win.addstr("#{reporter.final_score}")
    win.setpos(17, 3)
    win.addstr("Hit enter...")
    win.getch
  end

  private
    def self.screen_center
      (cols - WINDOW_LENGTH) / 2
    end

    def self.top_ten_percent
      (lines.to_f * 0.1).to_i
    end
end
