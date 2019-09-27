# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe "Computer" do
    context "#initialize" do
      # it "sets the @color_spectrum instance variable" do
      #   hal = Computer.new
      #   expect(hal.color_spectrum).to eq(%w[red green yellow blue black magenta cyan white])
      # end

      it "sets the @guess_set instance variable to 0 by default" do
        hal = Computer.new
        expect(hal.guess_set).to eq(0)
      end

      it "can accept a parameter for the guess_set instance variable" do
        hal = Computer.new(1)
        expect(hal.guess_set).to eq(1)
      end

      it "sets the @correct_colors instance variable to an empty Array" do
        hal = Computer.new
        expect(hal.correct_colors).to be_an(Array)
        expect(hal.correct_colors.length).to eq(0)
      end

      it "allows @correct_colors to be set to an array optionally" do
        hal = Computer.new(0, %w[red green blue yellow])
        expect(hal.correct_colors).to eq(%w[red green blue yellow])
      end
    end

    context "#color_spectrum" do
      it "returns a single element by index" do
        hal = Computer.new
        expect(hal.color_spectrum[0]).to eq("red")
      end
    end

    context "#guess" do
      it "doesn't do anything yet" do
        # hint = Hint.new("green", "white", "white", "white")
        # hal = Computer.new
      end
    end

    context "#get_guess" do
      it "the first guess_set is all red" do
        hal = Computer.new
        hints = Array.new(12, Hint.new("white", "white", "white", "white"))
        expect(hal.get_guess(hints, 1)).to eq(%w[red red red red])
      end
      it "second guess_set is all green" do
        hal = Computer.new(1)
        hints = Array.new(12, Hint.new("white", "white", "white", "white"))
        expect(hal.get_guess(hints, 2)).to eq(%w[green green green green])
      end
      it "third guess_set is all yellow" do
        hal = Computer.new(2)
        hints = Array.new(12, Hint.new("white", "white", "white", "white"))
        expect(hal.get_guess(hints, 3)).to eq(%w[yellow yellow yellow yellow])
      end
      it "returns the @correct_colors as the computer_guess local variable" do
        hal = Computer.new(8, %w[red green yellow blue])
        hints = Array.new(12, Hint.new("white", "white", "white", "white"))
        expect(hal.get_guess(hints, 9)).to eq(%w[red green yellow blue])
      end
    end

    context "#color_is_correct" do
      it "evaluates first Hint#colors element for green-ness" do
        hints = Array.new(12, Hint.new("green", "white", "white", "white"))
        hal = Computer.new
        expect(hal.color_is_correct(hints, 2)).to eq(true)
      end
    end
  end
end
