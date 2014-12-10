require_relative "../src/config.rb"

class Reporter
  include GlobalConfig

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
end
