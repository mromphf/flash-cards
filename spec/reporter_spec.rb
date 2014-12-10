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

  it "builds a collection of report lines" do
    question = AdditionQuestion.new(5, 5)
    answer = 9
    new_reporter = reporter.add_entry(question.report_format(answer))
    expect(new_reporter.report_line(0)).to eq "5 + 5\t9\t\t10"
  end
end
