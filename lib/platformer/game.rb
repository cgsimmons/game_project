require 'gosu'
require 'platformer/map'
require 'platformer/player'
WIDTH, HEIGHT = 600, 600


class GameWindow < Gosu::Window
  def initialize
    super WIDTH, HEIGHT

    self.caption = "Cptn. Ruby"

    @sky = Gosu::Image.new("media/space.png", :tileable => true)
    @map = Map.new("media/cptn_ruby_map.txt")
    @cptn = Player.new(@map, 400, 100)
    # The scrolling position is stored as top left corner of the screen.
    @camera_x = @camera_y = 0
  end

  def update
    move_x = 0
    move_x -= 5 if Gosu::button_down? Gosu::KbLeft
    move_x += 5 if Gosu::button_down? Gosu::KbRight
    @cptn.update(move_x)
    @cptn.collect_gems(@map.gems)
    # Scrolling follows player
    @camera_x = [[@cptn.x - WIDTH / 2, 0].max, @map.width * 50 - WIDTH].min
    @camera_y = [[@cptn.y - HEIGHT / 2, 0].max, @map.height * 50 - HEIGHT].min
  end

  def draw
    @sky.draw 0, 0, 0
    Gosu::translate(-@camera_x, -@camera_y) do
      @map.draw
      @cptn.draw
    end
  end

  def button_down(id)
    if id == Gosu::KbUp then
      @cptn.try_to_jump
    end
  end
end

window = GameWindow.new
window.show
