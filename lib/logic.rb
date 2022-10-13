class Logic
  def initialize
    @colors = %w[r g b y]
  end

  def generate_code(size)
    code = []
    size.times { code << @colors.sample }
    code
  end

  def check_code(code)
    code.chars.each { |color| return false unless @colors.include?(color) }
    true
  end

  def check_guess(guess, size)
    guess.chars.each { |color| return false unless @colors.include?(color) && guess.length == size }
    true
  end

  def check_win(guess, code)
    guess == code
  end

  def check_exact_match(guess, code)
    exact_match = 0
    guess.chars.each_with_index { |color, index| exact_match += 1 if color == code[index] }
    exact_match
  end

  def check_color_match(guess, code)
    color_match = 0
    guess.chars.each do |color|
      color_match += 1 if code.include?(color)
    end
    color_match
  end
end
