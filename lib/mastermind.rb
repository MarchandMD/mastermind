# frozen_string_literal: true

require 'mastermind/version'

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './mastermind/colorcode.rb'
require_relative './mastermind/secretcode.rb'
require_relative './mastermind/peg.rb'
require_relative './mastermind/gameboard.rb'
