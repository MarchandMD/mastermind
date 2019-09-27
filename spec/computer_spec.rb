# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe "Computer" do
    context "#initialize" do
      it "sets the @color_spectrum instance variable" do
        hal = Computer.new
        expect(hal.color_spectrum).to eq(%w[red orange yellow green blue indigo violet])
      end

      it "sets the @guess_set instance variable to 0" do
        hal = Computer.new
        expect(hal.guess_set).to eq(0)
      end

      it "sets the @correct_colors instance variable to an empty Array" do
        hal = Computer.new
        expect(hal.correct_colors).to be_an(Array)
        expect(hal.correct_colors.length).to eq(0)
      end
    end

    context '#color_spectrum' do
      it 'returns a single element by index' do
        hal = Computer.new
        expect(hal.color_spectrum[0]).to eq('red')
      end
    end

    context "#guess" do
      it "assigns a Hint object to #guess method" do
        hint = Hint.new("green", "white", "white", "white")
        hal = Computer.new
      end
    end

    context "#get_guess" do
      it "returns the 'computer_guess' local variable" do
        hal = Computer.new
        hints = Array.new(12, Hint.new('white', 'white', 'white', 'white'))
        expect(hal.get_guess(hints,2)).to be_falsey
      end
    end

    context "#color_is_correct" do
      it 'evaluates first Hint#colors element for green-ness' do
        hints = Array.new(12, Hint.new("green", "white", "white", "white"))
        hal = Computer.new
        expect(hal.color_is_correct(hints, 2)).to eq(true)
      end
    end
  end
end
