require_relative 'colors'

TITLE = 'Mastermind Game'.yellow.bold.center(64)
CREDITS = 'By: @LuisHernandezCoding'.yellow.bold.center(64)


class Header
  def show_header
    puts
    puts ORANGE_FULL_LINE, ORANGE_FRAME_LINE, ORANGE_TITLE_LINE
    puts ORANGE_CREDITS_LINE, ORANGE_FRAME_LINE, SEPARATOR
  end  
end