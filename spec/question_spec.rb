require_relative '../src/question.rb'

describe AdditionQuestion do
  let(:question) { AdditionQuestion.new(5, 5) }

  describe "constructor" do
    it "should generate a valid addition question" do
      expect(question).to be_a(AdditionQuestion)
    end
  end

  describe "to string" do
    it "should provide the expected output" do
      expect(question.to_s).to eq("5 + 5")
    end
  end

  it "should evaluate the correct answer as true" do
    expect(question.correct_answer?(10)).to eq(true)
  end 

  it "should evaluate a wrong answer as false" do
    expect(question.correct_answer?(9)).to eq(false)
  end

  it "can generate a random addition question" do
    question_a = AdditionQuestion.get_random_question("novice")
    question_b = AdditionQuestion.get_random_question("intermediate")
    question_c = AdditionQuestion.get_random_question("advanced")
    expect(question_a).to be_a(AdditionQuestion)
    expect(question_b).to be_a(AdditionQuestion)
    expect(question_c).to be_a(AdditionQuestion)
  end

  it "cannot generate a random question with an invalid difficulty" do
    expect { AdditionQuestion.get_random_question("") }.to raise_error
    expect { AdditionQuestion.get_random_question("klj7S**&&&") }.to raise_error
    expect { AdditionQuestion.get_random_question("3334") }.to raise_error
    expect { AdditionQuestion.get_random_question("novice-xxx") }.to raise_error
  end

  it "can generate a report-format string" do
    expect(question.report_format(9)).to eq "5 + 5\t9\t\t10"
  end
end

describe SubtractionQuestion do
  let(:question) { SubtractionQuestion.new(10, 5) }

  describe "constructor" do
    it "should generate a valid addition question" do
      expect(question).to be_a(SubtractionQuestion)
    end
  end

  describe "to string" do
    it "should provide the expected output" do
      expect(question.to_s).to eq("10 - 5")
    end

    it "should order the highest operand first" do
      new_question = SubtractionQuestion.new(3, 7)
      expect(new_question.to_s).to eq("7 - 3")
    end
  end

  it "should evaluate the correct answer as true" do
    expect(question.correct_answer?(5)).to eq(true)

    alternate_question = SubtractionQuestion.new(4, 10)
    expect(alternate_question.correct_answer?(6)).to eq(true)
  end 

  it "should evaluate a wrong answer as false" do
    expect(question.correct_answer?(4)).to eq(false)
  end

  it "can generate a random subtraction question" do
    question_a = SubtractionQuestion.get_random_question("novice")
    question_b = SubtractionQuestion.get_random_question("intermediate")
    question_c = SubtractionQuestion.get_random_question("advanced")
    expect(question_a).to be_a(SubtractionQuestion)
    expect(question_b).to be_a(SubtractionQuestion)
    expect(question_c).to be_a(SubtractionQuestion)
  end

  it "cannot generate  arandom question with an invalid difficulty" do
    expect { SubtractionQuestion.get_random_question("") }.to raise_error
    expect { SubtractionQuestion.get_random_question("klj7S**&&&") }.to raise_error
    expect { SubtractionQuestion.get_random_question("3334") }.to raise_error
    expect { SubtractionQuestion.get_random_question("novice-xxx") }.to raise_error
  end

  it "can generate a report-format string" do
    expect(question.report_format(9)).to eq "10 - 5\t9\t\t5"
  end
end

describe MultiplicationQuestion do
  let(:question) { MultiplicationQuestion.new(10, 5) }

  describe "constructor" do
    it "should generate a valid multiplication question" do
      expect(question).to be_a(MultiplicationQuestion) end
  end

  describe "to string" do
    it "should provide the expected output" do
      expect(question.to_s).to eq("10 * 5")
    end
  end

  it "should evaluate the correct answer as true" do
    expect(question.correct_answer?(50)).to eq(true)
  end

  it "should evaluate a wrong answer as false" do
    expect(question.correct_answer?(51)).to eq(false)
  end

  it "can generate a random multiplication question" do
    question_a = MultiplicationQuestion.get_random_question("novice")
    question_b = MultiplicationQuestion.get_random_question("intermediate")
    question_c = MultiplicationQuestion.get_random_question("advanced")
    expect(question_a).to be_a(MultiplicationQuestion)
    expect(question_b).to be_a(MultiplicationQuestion)
    expect(question_c).to be_a(MultiplicationQuestion)
  end

  it "cannot generate  arandom question with an invalid difficulty" do
    expect { MultiplicationQuestion.get_random_question("") }.to raise_error
    expect { MultiplicationQuestion.get_random_question("klj7S**&&&") }.to raise_error
    expect { MultiplicationQuestion.get_random_question("3334") }.to raise_error
    expect { MultiplicationQuestion.get_random_question("novice-xxx") }.to raise_error
  end

  it "can generate a report-format string" do
    expect(question.report_format(9)).to eq "10 * 5\t9\t\t50"
  end
end

describe DivisionQuestion do
  let(:question) { DivisionQuestion.new(10, 5) }

  describe "constructor" do
    it "should generate a valid multiplication question" do
      expect(question).to be_a(DivisionQuestion)
    end

    it "will raise an error if the second operand is greater than the first" do
      expect { DivisionQuestion.new(2, 10) }.to raise_error
    end
  end

  it "to string should provide the expected output" do
    expect(question.to_s).to eq("10 / 5")
  end

  it "should evaluate the correct answer as true" do
    expect(question.correct_answer?(2)).to eq(true)
  end

  it "should evaluate a wrong answer as false" do
    expect(question.correct_answer?(3)).to eq(false)
  end

  it "can generate a random division question" do
    question_a = DivisionQuestion.get_random_question("novice")
    question_b = DivisionQuestion.get_random_question("novice")
    question_c = DivisionQuestion.get_random_question("novice")
    expect(question_a).to be_a(DivisionQuestion) 
    expect(question_b).to be_a(DivisionQuestion) 
    expect(question_c).to be_a(DivisionQuestion) 
  end
  
  it "cannot generate  arandom question with an invalid difficulty" do
    expect { DivisionQuestion.get_random_question("") }.to raise_error
    expect { DivisionQuestion.get_random_question("klj7S**&&&") }.to raise_error
    expect { DivisionQuestion.get_random_question("3334") }.to raise_error
    expect { DivisionQuestion.get_random_question("novice-xxx") }.to raise_error
  end

  it "can generate a report-format string" do
    expect(question.report_format(9)).to eq "10 / 5\t9\t\t2"
  end
end
