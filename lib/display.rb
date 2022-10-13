require_relative 'board'
require_relative 'cursor'
require_relative 'colors'

TITLE = 'Mastermind Game'.bold.center(55)
CREDITS = 'By: @LuisHernandezCoding'.bold.center(55)

MARGIN = ' ' * 4
SIDE = ' ' * 13
SIDE_LINE = ' ' * 12

FULL_LINE = MARGIN + (' ' * 72)
FRAME = ('+' * 50).bg_black.bold
BLINK_SYMBOL = '++'.bg_black.bold

class Display
  attr_reader :cursor
  attr_accessor :message, :message2, :instructions, :board, :size, :attempts, :exact_match, :color_match
  attr_writer :game_started, :correct_guess, :length_match

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
    @message = ''
    @message2 = ''
    @game_started = false
    @instructions = false
    @size = 'Undefined'
    @attempts = 'Undefined'
    @exact_match = []
    @color_match = []
  end

  def update
    system('clear')
    show_header
    show_instructions if @instructions
    show_message unless @message.empty? && @message2.empty?
    render_board if @game_started
    show_input_bar
  end

  def render_board
    puts MARGIN + "Exacts: #{@exact_match.last} │ Colors: #{@color_match.last}".center(72).bg_magenta.bold
    puts MARGIN + (SIDE + "┌─────#{'─' * @size * 5}┐ ┌Exacts┐  ┌Colors┐" + SIDE).bg_magenta.bold
    row_title = @size.times.map { |i| "  #{i + 1}  " }.join
    puts MARGIN + (SIDE + "│     #{row_title}│ │      │  │      │" + SIDE).bg_magenta.bold
    @board.grid.reverse.each_with_index do |row, i|
      row_content = row.map do |cell|
        case cell
        when 'r'
          '  R  '.bg_red.bold
        when 'g'
          '  G  '.bg_green.bold
        when 'b'
          '  B  '.bg_blue.bold
        when 'y'
          '  Y  '.bg_orange.bold
        else
          '  -  '.bg_magenta.bold
        end
      end

      left = MARGIN + "#{SIDE}│ ".bg_magenta.bold
      choces = "#{@board.grid.length - i} ->#{row_content.join}".bg_magenta.bold

      results = "│ │  >#{@exact_match[i]}  │  │  >#{@color_match[i]}  │".bg_magenta.bold

      right = SIDE.bg_magenta.bold
      final = left + choces + results + right
      puts final
    end
    puts MARGIN + (SIDE + "└─────#{'─' * @size * 5}┘ └──────┘  └──────┘" + SIDE).bg_magenta.bold
  end

  def show_header
    puts
    puts MARGIN + (' ' * 72).bg_red
    puts MARGIN + (' ' * 11).bg_red + FRAME + (' ' * 11).bg_red
    puts MARGIN + 'Size:'.center(11).bg_red + BLINK_SYMBOL + TITLE + BLINK_SYMBOL + 'Attepmts:'.center(11).bg_red
    puts MARGIN + @size.to_s.center(11).bg_red + BLINK_SYMBOL + CREDITS + BLINK_SYMBOL + @attempts.to_s.center(11).bg_red
    puts MARGIN + (' ' * 11).bg_red + FRAME + (' ' * 11).bg_red
    puts MARGIN + ('_' * 72).bg_red.bold
  end

  def show_instructions
    instructions_text = []
    instructions_text[0] = 'Instructions'
    instructions_text[1] = 'The computer will generate a code of 4 colors.'
    instructions_text[2] = 'The colors are: (r)ed, (g)reen, (b)lue, (y)ellow'
    instructions_text[3] = 'You can set the dificulty that changes the size and the tries you have.'
    instructions_text[4] = 'The computer will give you feedback on your guess.'
    instructions_text[5] = 'The feedback will be: (e)xact match, (c)olor match, (l)ength match'
    instructions_text[6] = 'The game will end when you guess the code or run out of tries.'
    puts MARGIN + (' ' * 72).bg_green
    puts MARGIN + instructions_text[0].center(72).bg_green.bold
    puts MARGIN + (MARGIN + ('_' * 64) + MARGIN).bg_green
    puts MARGIN + (' ' * 72).bg_green
    instructions_text[1..6].each do |text|
      puts MARGIN + text.center(72).bg_green
    end
    puts MARGIN + ('_' * 72).bg_green.bold
  end

  def show_message
    puts MARGIN + (' ' * 72).bg_magenta
    puts MARGIN + @message.center(72).bg_magenta.yellow.bold
    puts MARGIN + @message2.center(72).bg_magenta.yellow.bold
    puts MARGIN + ('_' * 72).bg_magenta.bold
  end

  def show_input_bar
    puts MARGIN + (' ' * 72).bg_blue
    print MARGIN + '  >>'.bg_blue.bold
  end
end
