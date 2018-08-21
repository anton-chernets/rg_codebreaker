require 'codebreaker/version'
require 'codebreaker/game'
require 'json'

# Set of initial module settings
module Codebreaker
  GameConfiguration = Struct.new(:player_name, :save_score)
end