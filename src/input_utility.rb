class InputUtility
  def self.get_user_int(prompt)
    puts prompt
    print ">"
    user_int = STDIN.gets.chomp.to_i
    if user_int < 4000000 && user_int >= 0
      return user_int
    else
      raise "User input: #{user_int} was out of bounds."
    end
  end
end
