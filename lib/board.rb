class Board
  attr_reader :grid
  attr_writer :grid_size

  def initialize
    @grid = Array.new(10) { Array.new(4) }
  end

  def set_config(size, attempts)
    @grid = Array.new(attempts) { Array.new(size) }
  end

  def add_guess(guess, row)
    @grid[row] = guess.chars
  end

  def clear
    @grid = Array.new(10) { Array.new(4) }
  end
end
