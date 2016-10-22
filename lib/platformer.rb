require "platformer/version"
require 'platformer/collectible_gem'
require 'platformer/map'
require 'platformer/player'
require 'platformer/game'
WIDTH, HEIGHT = 600, 600

module Tiles
  Grass = 0
  Earth = 1
end

module Platformer
  def self.init
    begin
      $game = Game.new
      $game.begin!
    rescue Interrupt => e
      puts "\r Something goes wrong! :("
    end
  end
end

Platformer.init
