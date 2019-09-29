# frozen_string_literal: true

require 'mastermind/version'

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './mastermind/colorcode.rb'
require_relative './mastermind/gameboard.rb'
require_relative './mastermind/hint.rb'
require_relative './mastermind/computer.rb'
require_relative './mastermind/engine.rb'
