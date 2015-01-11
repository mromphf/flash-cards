require_relative "config.rb"

class AdditionQuestion 
  include GlobalConfig

  def initialize(operand_a, operand_b)
    @operand_a = operand_a
    @operand_b = operand_b
  end

  def to_s
    "#{@operand_a} + #{@operand_b}"
  end

  def correct_answer?(answer)
    @operand_a + @operand_b == answer
  end

  def report_format(answer)
    "#{to_s}\t#{answer}\t\t#{@operand_a + @operand_b}"
  end

  def self.get_random_question(difficulty)
    AdditionQuestion.new(random_operand(difficulty), 
                         random_operand(difficulty))
  end

  protected
    def self.random_operand(difficulty)
      if PARAMETER_RANGES[difficulty].nil?
        raise "ERROR: Cannot generate operand with the difficulty provided."
      end
      Random.rand(PARAMETER_RANGES[difficulty])
    end
end

class SubtractionQuestion < AdditionQuestion
  def to_s
    if @operand_a >= @operand_b
      "#{@operand_a} - #{@operand_b}"
    else
      "#{@operand_b} - #{@operand_a}"
    end
  end

  def correct_answer?(answer)
    (@operand_a - @operand_b).abs == answer
  end

  def report_format(answer)
    "#{to_s}\t#{answer}\t\t#{(@operand_a - @operand_b).abs}"
  end

  def self.get_random_question(difficulty)
    SubtractionQuestion.new(random_operand(difficulty), 
                            random_operand(difficulty))
  end
end

class MultiplicationQuestion < AdditionQuestion
  def to_s
    "#{@operand_a} * #{@operand_b}"
  end

  def correct_answer?(answer)
    (@operand_a * @operand_b) == answer
  end

  def report_format(answer)
    "#{to_s}\t#{answer}\t\t#{@operand_a * @operand_b}"
  end

  def self.get_random_question(difficulty)
    MultiplicationQuestion.new(random_operand(difficulty), 
                               random_operand(difficulty))
  end
end

class DivisionQuestion < AdditionQuestion
  def initialize(operand_a, operand_b)
    if operand_b > operand_a
      raise "ERROR: Second operand of a divison question must be smaller than the first."
    end
    super(operand_a, operand_b)
  end

  def to_s
    "#{@operand_a} / #{@operand_b}"
  end

  def correct_answer?(answer)
    (@operand_a / @operand_b) == answer
  end

  def report_format(answer)
    "#{to_s}\t#{answer}\t\t#{@operand_a / @operand_b}"
  end

  def self.get_random_question(difficulty)
    operand_b = random_operand(difficulty)
    divisor = random_operand(difficulty)
    operand_a = operand_b * divisor
    DivisionQuestion.new(operand_a, operand_b)
  end
end
