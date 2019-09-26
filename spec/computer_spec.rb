# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe "Computer" do
    context "#initialize" do
      it 'sets the @color_spectrum instance variable' do
        hal = Computer.new
        expect(hal.color_spectrum).to eq(%w[red orange yellow green blue indigo violet])
      end

      it 'sets the @guess_set instance variable to 0' do
        hal = Computer.new
        expect(hal.guess_set).to eq(0)
      end

      it 'sets the @correct_colors instance variable to an empty Array' do
        hal = Computer.new
        expect(hal.correct_colors).to be_an(Array)
        expect(hal.correct_colors.length).to eq(0)
      end
    end

    context "#guess" do
      it 'has yet to be written a unit test' do
        # unit test here
      end
    end

    context '#get_guess' do
        it 'does something' do
            # unit tests here
        end
    end

  end
end
