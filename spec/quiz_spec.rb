require_relative "../src/quiz.rb"
require_relative "../src/question.rb"

describe AdditionQuiz do
  let(:quiz) { AdditionQuiz.new("novice") }

  it "should be valid" do
    expect(quiz).to be_a(AdditionQuiz)
  end

  it "can tell when the quiz is still running" do
    expect(quiz.size).to eq 10
  end

  it "generates addition questions" do
    question = quiz.get_random_question
    expect(question).to be_a(AdditionQuestion)
  end

  it "gives the correct feedback when a question is answered" do
    question = AdditionQuestion.new(1, 1)
    expect(quiz.give_feedback(question, 2)).to eq "Correct!"
    expect(quiz.give_feedback(question, 3)).to eq "Wrong..."
  end

  it "displays the correct results" do
    expect(quiz.results).to eq("Final score: 0%")
  end

  describe "returns a new version of itself with an updated final score" do
    it "when answered correctly" do
      question = AdditionQuestion.new(1, 1)
      new_quiz = quiz.answer_question(question, 2)
      new_quiz = new_quiz.answer_question(question, 2)
      expect(new_quiz.results).to eq("Final score: 20%")
    end
    
    it "when answered wrong" do
      question = AdditionQuestion.new(1, 1)
      new_quiz = quiz.answer_question(question, 3)
      expect(new_quiz.results).to eq("Final score: 0%")
    end
  end

  it "updates its score correctly" do
    question = AdditionQuestion.new(1, 1)
    expect(quiz.display_score).to eq ""
    new_quiz = quiz.answer_question(question, 2)
    expect(new_quiz.display_score).to eq(".")
    new_quiz = quiz.answer_question(question, 2)
    expect(new_quiz.display_score).to eq("..")
    new_quiz = quiz.answer_question(question, 3)
    expect(new_quiz.display_score).to eq("..F")
  end
end

describe SubtractionQuiz do
  let(:quiz) { SubtractionQuiz.new("novice") }

  it "should be valid" do
    expect(quiz).to be_a(SubtractionQuiz)
  end

  it "generates subtraction questions" do
    question = quiz.get_random_question
    expect(question).to be_a(SubtractionQuestion)
  end

  it "gives the correct feedback when a question is answered" do
    question = SubtractionQuestion.new(3, 7)
    expect(quiz.give_feedback(question, 4)).to eq "Correct!"
    expect(quiz.give_feedback(question, 3)).to eq "Wrong..."
  end

  it "displays the correct results" do
    expect(quiz.results).to eq("Final score: 0%")
  end

  describe "returns a new version of itself with an updated final score" do
    it "when answered correctly" do
      question = SubtractionQuestion.new(4, 2)
      new_quiz = quiz.answer_question(question, 2)
      expect(new_quiz.results).to eq("Final score: 10%")
    end
    
    it "when answered wrong" do
      question = SubtractionQuestion.new(1, 1)
      new_quiz = quiz.answer_question(question, 81)
      expect(new_quiz.results).to eq("Final score: 0%")
    end
  end

  it "updates its score correctly" do
    question = SubtractionQuestion.new(4, 3)
    expect(quiz.display_score).to eq ""
    new_quiz = quiz.answer_question(question, 1)
    expect(new_quiz.display_score).to eq(".")
    new_quiz = quiz.answer_question(question, 1)
    expect(new_quiz.display_score).to eq("..")
    new_quiz = quiz.answer_question(question, 6)
    expect(new_quiz.display_score).to eq("..F")
  end
end

describe MultiplicationQuiz do
  let(:quiz) { MultiplicationQuiz.new("novice") }

  it "should be valid" do
    expect(quiz).to be_a(MultiplicationQuiz)
  end

  it "generates multiplication questions" do
    question = quiz.get_random_question
    expect(question).to be_a(MultiplicationQuestion)
  end

  it "gives the correct feedback when a question is answered" do
    question = MultiplicationQuestion.new(3, 2)
    expect(quiz.give_feedback(question, 6)).to eq "Correct!"
    expect(quiz.give_feedback(question, 5)).to eq "Wrong..."
  end

  it "displays the correct results" do
    expect(quiz.results).to eq("Final score: 0%")
  end

  describe "returns a new version of itself with an updated final score" do
    it "when answered correctly" do
      question = MultiplicationQuestion.new(2, 3)
      new_quiz = quiz.answer_question(question, 6)
      expect(new_quiz.results).to eq("Final score: 10%")
    end
    
    it "when answered wrong" do
      question = SubtractionQuestion.new(2, 3)
      new_quiz = quiz.answer_question(question, 81)
      expect(new_quiz.results).to eq("Final score: 0%")
    end
  end

  it "updates its score correctly" do
    question = MultiplicationQuestion.new(2, 2)
    expect(quiz.display_score).to eq ""
    new_quiz = quiz.answer_question(question, 4)
    expect(new_quiz.display_score).to eq(".")
    new_quiz = quiz.answer_question(question, 4)
    expect(new_quiz.display_score).to eq("..")
    new_quiz = quiz.answer_question(question, 6)
    expect(new_quiz.display_score).to eq("..F")
  end
end

describe DivisionQuiz do
  let(:quiz) { DivisionQuiz.new("novice") }

  it "should be valid" do
    expect(quiz).to be_a(DivisionQuiz)
  end

  it "generates division questions" do
    question = quiz.get_random_question
    expect(question).to be_a(DivisionQuestion)
  end

  it "gives the correct feedback when a question is answered" do
    question = DivisionQuestion.new(6, 2)
    expect(quiz.give_feedback(question, 3)).to eq "Correct!"
    expect(quiz.give_feedback(question, 4)).to eq "Wrong..."
  end

  describe "returns a new version of itself with an updated final score" do
    it "when answered correctly" do
      question = DivisionQuestion.new(8, 2)
      new_quiz = quiz.answer_question(question, 4)
      expect(new_quiz.results).to eq("Final score: 10%")
    end
    
    it "when answered wrong" do
      question = SubtractionQuestion.new(8, 2)
      new_quiz = quiz.answer_question(question, 81)
      expect(new_quiz.results).to eq("Final score: 0%")
    end
  end

  it "updates its score correctly" do
    question = DivisionQuestion.new(10, 2)
    expect(quiz.display_score).to eq ""
    new_quiz = quiz.answer_question(question, 5)
    expect(new_quiz.display_score).to eq(".")
    new_quiz = quiz.answer_question(question, 5)
    expect(new_quiz.display_score).to eq("..")
    new_quiz = quiz.answer_question(question, 6)
    expect(new_quiz.display_score).to eq("..F")
  end
end
