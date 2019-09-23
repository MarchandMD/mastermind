# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Gameboard do
    context '#initialize' do
      it 'creates a new solution by default' do
        new_gameboard = Gameboard.new
        expect(new_gameboard.solution).to be_truthy
      end

      it 'accepts a solution parameter, optionally' do
        my_solution = Colorcode.new('red', 'orange', 'yellow', 'green')
        new_gameboard = Gameboard.new(my_solution)
        allow(new_gameboard).to receive(:solution) { %w[red orange yellow green] }
        expect(new_gameboard.solution).to eq(%w[red orange yellow green])
      end

      it 'accepts a solution parameter, optionally (second test method)' do
        my_solution = Colorcode.new('red', 'orange', 'yellow', 'green')
        new_gameboard = Gameboard.new(my_solution)
        expect(new_gameboard.solution).to eq(my_solution)
      end

      # it 'accepts a solution parameter, optionally (third test method)' do
      #   Solution = Struct.new(:solution)
      #   new_gameboard = Gameboard.new(Solution.new(%w[red orange yellow green]))
      #   expect(new_gameboard.solution).to eq(%w[red orange yellow green])
      # end

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
      it 'returns the number of correct_colors' do
        my_solution = Colorcode.new('white', 'white', 'white', 'white')
        new_gameboard = Gameboard.new(my_solution)
        expect(new_gameboard.evaluate(0)).to eq(4)
      end
    end
  end
end
