require 'pry'
class Mastermind
  attr_reader :code, :guesses

  def initialize(code = generate_code)
    @code = code
    @guesses = 0
  end

  def add_guess
    @guesses += 1
  end

  def guess(user_string)
    in_position = correct_positions(user_string)
    total = total_correct(user_string)
    add_guess
    [total, in_position]
  end

  private
    def generate_code
      colors = ["r", "g", "b", "y"]
      code = colors.map{colors.sample(1)}
      code.flatten
    end

    def correct_positions(user_string)
      in_position = 0
      user_string.split("").each_with_index do |char, index|
        in_position += 1 if @code[index] == char
      end
      in_position
    end

    def total_correct(user_string)
      leftover = @code.dup
      user_string.split("").each do |char|
        if leftover.include?(char)
          leftover.delete_at(leftover.index(char))
        end
      end
      4 - leftover.length
    end
end
