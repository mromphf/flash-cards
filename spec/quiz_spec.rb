require_relative "../src/quiz.rb"
require_relative "../src/question.rb"

describe AdditionQuiz do
  let(:quiz) { AdditionQuiz.new("novice") }

  it "should be valid" do
    expect(quiz).to be_a(AdditionQuiz)
  end

  it "can tell when the quiz is still running" do
    expect(quiz.running?).to eq true
    (1..5).each { |i| quiz.answer_question!(AdditionQuestion.new(1, 1), 2) }
    expect(quiz.running?).to eq false
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
    (1..5).each { |i| quiz.answer_question!(AdditionQuestion.new(1, 1), 2) }
    expect(quiz.results).to eq("Final score: 100%")

    question = AdditionQuestion.new(1, 1)
    other_quiz = AdditionQuiz.new("novice")
    other_quiz.answer_question!(question, 2)
    other_quiz.answer_question!(question, 2)
    other_quiz.answer_question!(question, 2)
    other_quiz.answer_question!(question, 1)
    other_quiz.answer_question!(question, 1)
    expect(other_quiz.results).to eq("Final score: 60%")
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
end
