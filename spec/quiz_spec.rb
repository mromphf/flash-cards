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

  it "updates its score correctly" do
    expect(quiz.display_score).to eq ""

    quiz = AdditionQuiz.new("novice", [true, false, true])
    expect(quiz.display_score).to eq ".F."
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

  it "updates its score correctly" do
    expect(quiz.display_score).to eq ""

    quiz = MultiplicationQuiz.new("novice", [false, false, false, false])
    expect(quiz.display_score).to eq "FFFF"
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

  it "updates its score correctly" do
    expect(quiz.display_score).to eq ""

    quiz = MultiplicationQuiz.new("novice", [false, true, false, true])
    expect(quiz.display_score).to eq "F.F."
  end
end
