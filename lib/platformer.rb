require "platformer/version"
require 'platformer/collectible_gem'
require 'platformer/map'
require 'platformer/player'
require 'platformer/game'

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
