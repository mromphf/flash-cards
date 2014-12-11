require_relative "../src/reporter.rb"
require_relative "../src/question.rb"

describe Reporter do
  let(:reporter) { Reporter.new }

  it "should be valid" do
    expect(reporter).to be_a(Reporter)
  end

  it "generates a report header" do
    expect(reporter.header).to eq "Question\tSubmission\tAnswer"
  end

  it "generates a new repoter when a report line is addded" do
    question = AdditionQuestion.new(5, 5)
    expect(reporter.add_entry(question, 9)).to be_a(Reporter)
  end

  it "builds a collection of report lines" do
    question = AdditionQuestion.new(5, 5)
    new_reporter = reporter.add_entry(question, 9)
    expect(new_reporter.report_line(0)).to eq "5 + 5\t9\t\t10"

    question = AdditionQuestion.new(3, 3)
    new_reporter = reporter.add_entry(question, 7)
    expect(new_reporter.report_line(1)).to eq "3 + 3\t7\t\t6"
    
    question = AdditionQuestion.new(4, 5)
    new_reporter = reporter.add_entry(question, 7)
    expect(new_reporter.report_line(2)).to eq "4 + 5\t7\t\t9"
  end

  it "can correctly display the final score" do
    reporter = Reporter.new([], [true, true, true])
    expect(reporter.final_score).to eq "Final Score: 30%"

    reporter = Reporter.new([], [true, false, true, true, true])
    expect(reporter.final_score).to eq "Final Score: 40%"
  end
end
