# frozen_string_literal: true

require_relative "gameboard"
require_relative "colorcode"
require_relative "hint"
require_relative "computer"

# responsible for the game engine
module Mastermind
  # the Engine class
  class Engine
    attr_accessor :gameboard, :win, :turns, :color_spectrum, :player_mode, :computer

    def initialize
      @gameboard = Gameboard.new
      @win = false
      @turns = 1
      @color_spectrum = %w[red green yellow blue black magenta cyan white]
      @player_mode = true
      @computer = Computer.new
    end

    def play
      instructions
      prompt_switch_mode
      set_solution if player_mode == false
      start
    end

    def instructions
      puts "      __  __            _                     _           _
     |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
     | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
     |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
      puts "_________________________________________________________\n\n"
      puts "Guess the code to win!"
      puts "The computer will select a code of four different colors in a specific order!"
      puts "You have twelve guesses."
      gameboard.display
      puts "_________________________________________________________\n\n"
      puts "The left side is where your guesses will go."
      puts "The right side will tell you how accurate you are: "
      puts "green for every color in the correct position"
      puts "red for every color in an incorrect position!"
      puts "\nGood luck!"
      puts "_________________________________________________________\n\n"
    end

    def prompt_switch_mode
      correct_responses = %w[make break]
      puts "Do you want to BREAK the code or MAKE the code?"
      print "Say \"make\" or \"break\".\n> "
      mode = gets.chomp
      until correct_responses.include?(mode)
        print "\nI didn't quite understand that. Say \"make\" or \"break.\"\n> "
        mode = gets.chomp
      end
      puts ""
      self.player_mode = false if mode == "make"
    end

    def set_solution
      puts "What would you like your solution to be?"
      puts "\nType four colors separated by spaces."
      print "Your choices are: red, green, yellow, blue, black, magenta, cyan, and white.\n> "
      solution = solicit_player_guess
      gameboard.solution = Colorcode.new(solution[0], solution[1], solution[2], solution[3])
    end

    def start
      make_guesses
      turns > 12 ? lose : win_game
    end

    def make_guesses
      while win == false && turns < 13
        prompt_for_guess
        guess = player_mode ? solicit_player_guess : solicit_computer_guess
        add_guess(guess)
        self.win = true if gameboard.guesses[12 - turns].colors == gameboard.solution.colors
        self.turns += 1 if win == false
      end
    end

    def prompt_for_guess
      return unless player_mode

      puts "What is your ##{turns} guess?"
      puts "Type four colors separated by spaces."
      print "Your choices are: red, green, yellow, blue, black, magenta, cyan, and white.\n> "
    end

    def solicit_player_guess
      1.times do
        guess = gets.chomp.downcase.split(" ")

        if guess.length != 4
          print "\nYou entered the wrong amount of colors! Try again:\n> "
          redo
        end


        unless guess_test(guess)
          print "\nYou can only enter the colors specified! Try again:\n> "
          redo
        end

        if player_mode == false && guess.uniq.length != 4

          print "\nYou must have different colors for the code. Try again:\n> "
          redo

        end

        return guess
      end
    end

    def guess_test(arr)
      arr.all? { |color| color_spectrum.include?(color) }
    end

    def solicit_computer_guess
      computer.guess(gameboard.hints, self.turns)
    end

    def add_guess(guess)
      gameboard.guesses[12 - turns] = Colorcode.new(guess[0], guess[1], guess[2], guess[3])
      gameboard.refresh(12 - turns)
    end

    def lose
      puts player_mode ? "You have failed to crack the puzzle! Better luck next time!" : "No... I have failed."
      puts "The solution was #{gameboard.solution.colors}."
    end

    def win_game
      puts player_mode ? "\nYou have solved the code! Amazing!" : "\nI have solved the code, thanks for the game!"
    end
  end
end

# To play the game, simply uncomment the next two lines (if they're comments) and run this file in your terminal
game = Mastermind::Engine.new
game.play
