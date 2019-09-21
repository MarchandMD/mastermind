# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Gameboard do
    context '#initialize' do
      it 'expects the solution to be a Colorcode object' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_a_kind_of(Colorcode)
      end

      it 'assigns an Array to @guesses' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.guesses).to be_an(Array)
      end
    end
  end
end
