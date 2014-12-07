module GlobalConfig
  USAGE = "USAGE: flashCards <operation> <difficulty> \n\tValid operations: add | sub | mul | div\n\tValid difficulties: novice | intermediate | advanced"
  VALID_OPERATIONS = ['add', 'sub', 'mul', 'div']
  VALID_DIFFICULTIES = ['novice', 'intermediate', 'advanced']
  NOVICE = "novice" 
  INTERMEDIATE = "intermediate"
  ADVANCED = "advanced"
  PARAMETER_RANGES = { NOVICE => 1..10,
                       INTERMEDIATE => 10..99,
                       ADVANCED => 100..299 }
  QUIZ_LENGTH = 5
  WINDOW_HEIGHT = 5
  WINDOW_LENGTH = 40
end
