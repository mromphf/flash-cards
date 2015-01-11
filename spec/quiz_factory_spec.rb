require_relative '../src/quiz_factory.rb'

describe QuizFactory do
  it "will generate addition quizzes" do
    args = ["sub", "novice"]
    quiz = QuizFactory.generate_quiz(args[0], args[1])
    expect(quiz).to be_a(AdditionQuiz)
  end

  it "will generate subtraction quizzes" do
    args = ["sub", "novice"]
    quiz = QuizFactory.generate_quiz(args[0], args[1])
    expect(quiz).to be_a(SubtractionQuiz)
  end

  it "will generate multiplication quizzes" do
    args = ["mul", "intermediate"]
    quiz = QuizFactory.generate_quiz(args[0], args[1])
    expect(quiz).to be_a(MultiplicationQuiz)
  end

  it "will generate divison quizzes" do
    args = ["div", "advanced"]
    quiz = QuizFactory.generate_quiz(args[0], args[1])
    expect(quiz).to be_a(DivisionQuiz)
  end
end
