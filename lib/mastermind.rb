# frozen_string_literal: true

require 'mastermind/version'

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './mastermind/colorcode'
require_relative './mastermind/gameboard'
require_relative './mastermind/hint'
require_relative './mastermind/computer'
require_relative './mastermind/engine'
