class Game
  attr_reader :guesses, :guess, :code, :logic

  def initialize
    @guesses = 0
    @guess = ''
    @code = ''
    @logic = Logic.new
    @display = Display.new
    @size = 'Undefined'
    @attempts = 'Undefined'
  end

  def start
    clear_everything
    @display.message = 'Welcome to Mastermind!'
    @display.message2 = 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    @display.update
    case gets.chomp
    when 'p'
      play
    when 'i'
      instructions
    when 'q'
      exit
    end
  end

  def set_difficulty
    @display.message = 'Choose a difficulty:'
    @display.message2 = '(b)eginner, (i)ntermediate, (a)dvanced'
    @display.update
    case gets.chomp
    when 'b'
      set_difficulty_values(4, 9)
    when 'i'
      set_difficulty_values(6, 7)
    when 'a'
      set_difficulty_values(8, 5)
    end
  end

  def set_difficulty_values(size, attempts)
    @size = @display.size = size
    @attempts = @display.attempts = attempts
    @display.board.set_config(size, attempts)
    @display.exact_match = Array.new(attempts, ' ')
    @display.color_match = Array.new(attempts, ' ')
  end

  def play
    set_difficulty
    @code = @logic.generate_code(@size)
    @guess = @logic.generate_code(@size)
    @display.game_started = true
    until @guesses == @attempts
      ask_for_guess
      check_guess
      check_win
      check_exact_match(@guesses)
      check_color_match(@guesses)
    end
    @display.message = 'You have run out of guesses. You lose!'
    @display.message2 = "The code was #{@code.join}."
    @display.update
    sleep(2)
    @display.message = 'Would you like to (p)lay again or (q)uit?'
    @display.message2 = ''
    @display.update
    start if gets.chomp == 'p'
    exit if gets.chomp == 'q'
  end

  def ask_for_guess
    @display.message = 'What is your guess?'
    @display.message2 = "Enter #{@size} colors (r)ed, (g)reen, (b)lue, (y)ellow."
    @display.update
    @guess = gets.chomp.downcase.chars
    until @logic.check_guess(@guess, @size)
      @display.message = 'Invalid guess!'
      @display.update
      @guess = gets.chomp.downcase.chars
    end
    @display.board.add_guess(@guess, @guesses)
    @guesses += 1
    @display.attempts -= 1
    @display.update
  end

  def check_guess
    return if @logic.check_guess(@guess, @size)

    @display.message = 'Incorrect guess!'
    @display.update
    sleep(1)
  end

  def check_win
    return unless @logic.check_win(@guess, @code)

    @display.message = 'You win!'
    @display.message2 = 'Would you like to (p)lay again or (q)uit?'
    @display.update
    awnser = gets.chomp
    return start if awnser == 'p'

    exit
  end

  def check_exact_match(guesses)
    @display.exact_match[-guesses] = @logic.check_exact_match(@guess, @code)
  end

  def check_color_match(guesses)
    @display.color_match[-guesses] = @logic.check_color_match(@guess, @code)
  end

  def instructions
    @display.message2 = 'Would you like to (p)lay or (q)uit?'
    @display.instructions = true
    @display.update
    case gets.chomp
    when 'p'
      @display.instructions = false
      @display.update
      play
    when 'q'
      exit
    end
  end

  def clear_everything
    @guesses = 0
    @guess = ''
    @code = ''
    @display.game_started = false
    @display.board.clear
    @display.update
  end
end
