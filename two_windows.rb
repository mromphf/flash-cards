#!/usr/bin/ruby1.9.1 -w

# This file has been included as an example

require 'curses'
include Curses

WINDOW_HEIGHT = 6
WINDOW_LENGTH = 50

def build_window(start_line)
  win = Window.new(WINDOW_HEIGHT, WINDOW_LENGTH, start_line, 10)
  win.box(?|, ?-)
  win.refresh
  win
end

def add_window_message(win, message)
  win.setpos(2, 3)
  win.addstr(message)
  win.refresh
end

init_screen
begin
  crmode

  win_a = build_window(3)
  win_b = build_window(13)

  add_window_message(win_b, "Your Name Here")
  add_window_message(win_a, "Enter your name: ")

  name = win_a.getstr

  win_b.setpos(3, 3)
  win_b.addstr(name)
  win_b.getch

  win_a.close
  win_b.close

  refresh
ensure
  close_screen
end
