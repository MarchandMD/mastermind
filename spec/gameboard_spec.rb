# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Gameboard do
    context '#initialize' do
      it 'is initialized with a Colorcode solution by default' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_a(Colorcode)
      end

      it 'can be initialized with a Colorcode solution' do
        my_solution = %w[red white yellow green]
        new_gameboard = Gameboard.new(my_solution)
        expect(new_gameboard.solution).to eq(%w[red white yellow green])
      end

      it 'is initialized with guesses by default' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.guesses).not_to be_empty
      end

      it 'can be initialized with pre-determined guesses' do
        guesses = %w[red white blue black]
        new_gameboard = Gameboard.new(nil, guesses)
        expect(new_gameboard.guesses).to eq(%w[red white blue black])
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
      it 'is a Colorcode object by default' do
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
      it 'returns a Hint object' do
        solution = Colorcode.new('red', 'white', 'blue', 'black')
        guesses = Array.new(12, Colorcode.new('red', 'blue', 'green', 'magenta'))
        new_gameboard = Gameboard.new(solution, guesses)
        expect(new_gameboard.evaluate(0)).to be_a(Hint)
      end
      it 'includes green or red or white items in the Hint object' do
        solution = Colorcode.new('red', 'white', 'blue', 'black')
        guesses = Array.new(12, Colorcode.new('orange', 'cyan', 'green', 'yellow'))
        new_gameboard = Gameboard.new(solution, guesses)
        expect(new_gameboard.evaluate(0).colors).to include("green").or include("red").or include("white")
      end
      it 'returns 4 elements' do
        solution = Colorcode.new('red', 'white', 'blue', 'black')
        guesses = Array.new(12, Colorcode.new('magenta', 'cyan', 'green', 'yellow'))
        new_gameboard = Gameboard.new(solution, guesses)
        expect(new_gameboard.evaluate(0).colors.length).to eq(4)
      end
    end
  end
end
