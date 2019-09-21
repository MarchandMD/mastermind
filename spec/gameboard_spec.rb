# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Gameboard do
    context '#initialize' do
      it 'expects the solution to be a Colorcode object' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_a_kind_of(Colorcode)
      end

      it 'creates a board with 12 rows of white placeholders' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.guesses).to be_an(Array)
      end
    end
  end
end
