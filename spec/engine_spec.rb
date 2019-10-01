# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe Engine do
    context "#initialize" do
      it "creates a Gameboard object" do
        new_engine = Engine.new
        expect(new_engine.gameboard).to be_a(Gameboard)
      end

      it 'sets win to false' do
        new_engine = Engine.new
        expect(new_engine.win).to be_falsey
      end

      it 'starts at turn 1' do
        engine = Engine.new
        expect(engine.turns).to eq(1)
      end

      it 'has a color spectrum attribute of the possible colors' do
        engine = Engine.new
        engine.color_spectrum.each do |el|
          expect(el).to eq('red').or eq('green').or eq('yellow').or eq('blue').or eq('black').or eq('magenta').or eq('cyan').or eq('white')
        end
      end

      it 'defaults to player mode' do
        engine = Engine.new
        expect(engine.player_mode).to be_truthy
      end

      it 'creats a Computer object' do
        engine = Engine.new
        expect(engine.computer).to be_a(Computer)
      end
    end

    context "#gameboard" do
      it 'returns the colors of the solution' do
        engine = Engine.new
        expect(engine.gameboard.solution.colors).to be_truthy
      end
    end

    context "#play" do
      it "starts to play" do
        # unit tests here
      end
    end
    context "#instructions" do
      it "provides instructions" do
        engine = Engine.new
        expect { engine.instructions }.to output.to_stdout
      end
    end
    context "#prompt_switch_mode" do
      it "prompts to switch modes" do
        # unit tests here
      end
    end
    context "#set_solution" do
      it "sets the solution" do
        # unit tests here
      end
    end
    context "#start" do
      it "starts to start" do
        # unit tests here
      end
    end
    context "#make_guesses" do
      it "makes guesses" do
        # unit tests here
      end
    end
    context "#prompt_guesses" do
      it "prompts for a guess" do
        # unit tests here
      end
    end
    context "#solicit_player_guess" do
      it "gets the players guess" do
        # unit tests here
      end
    end
    context "#solicit_computer_guess" do
      it "gets the computers guess" do
        engine = Engine.new
        expect(engine.solicit_computer_guess).to eq(%w[red red red red])
      end
    end
    context "#add_guess" do
      it "adds a guess" do
        # unit tests here
      end
    end
    context "#lose" do
      it "loses" do
        engine = Engine.new
        expect { engine.lose }.to output { "The solution was #{@gameboard.solution.colors}." }.to_stdout
      end
    end
    context "#win_game" do
      it "puts a message if player_mode is true, and you win" do
        engine = Engine.new
        expect { engine.win_game }.to output { "\nYou have solved the code! Amazing!" }.to_stdout
      end
    end
  end
end
