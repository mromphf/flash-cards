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

  def add_entry(entry, correct_answer)
    Reporter.new(@lines << entry, @scores << correct_answer)
  end

  def report_line(index)
    @lines[index].nil? ? "" : @lines[index]
  end

  def final_score
    score = 0
    @scores.each { |correct| score += correct ? 1 : 0 }
    "Final Score: #{((score.to_f / QUIZ_LENGTH.to_f) * 100).to_i}%"
  end
end
