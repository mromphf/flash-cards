require "curses"
require_relative "../src/windows_util.rb"
require_relative "../src/quiz.rb"
require_relative "../src/question.rb"

include Curses

describe WindowsUtil do
  before(:all) do
    init_screen
    crmode
  end

  after(:all) do
    close_screen
  end

  it "should generate the score window" do
    score_window = WindowsUtil.build_score_window
    expect(score_window).to be_a(Window)
  end

  it "should generate the quiz info window" do
    info_window = WindowsUtil.build_info_window
    expect(info_window).to be_a(Window)
  end
  
  it "should generate the quiz info window" do
    question_window = WindowsUtil.build_question_window(AdditionQuestion.new(1,1))
    expect(question_window).to be_a(Window)
  end
end
