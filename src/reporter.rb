class Reporter
  def initialize(report_lines = [])
    @lines = report_lines
  end

  def header
    "Question\tYour Answer\tActual Answer"
  end

  def add_entry(entry)
    Reporter.new(@lines << entry)
  end

  def report_line(index)
    @lines[index].nil? ? "" : @lines[index]
  end
end
