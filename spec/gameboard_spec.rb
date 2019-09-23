# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Gameboard do
    context '#initialize' do
      it 'creates a new solution' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_truthy
      end

      it 'creates a 12-row board for #display' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.guesses.length).to eq(12)
      end

      it 'creates 12-rows of hints' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.hints.length).to eq(12)
      end
    end

    context '#solution' do
      it 'is a Colorcode object' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_a_kind_of(Colorcode)
      end
    end

    context '#guesses' do
      it 'is an Array' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.guesses).to be_an(Array)
      end
    end

    context '#display' do
      it 'includes a solid line at the top' do
        new_gameboard = Gameboard.new
        expect { new_gameboard.display }.to output.to_stdout
      end
    end

    context '#evaluate' do
      it 'returns a value from the guesses instnace variable' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.evaluate(1)).to be_falsey
      end
    end
  end
end
