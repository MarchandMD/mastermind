# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe Colorcode do
    context "#initialize" do
      it "can be initialized with 4 parameters" do
        expect(Colorcode).to respond_to(:new).with(4).arguments
      end

      it "can be passed 4 user-defined parameters" do
        new_code = Colorcode.new("one", "two", "three", "four")
        expect(new_code.colors).to eq(%w[one two three four])
      end

      it "assigns an array to @colors by default" do
        new_code = Colorcode.new
        expect(new_code.colors).to be_instance_of(Array)
      end
    end

    context "#colors" do
      it "returns an Array" do
        new_code = Colorcode.new
        expect(new_code.colors).to be_an(Array)
      end

      it "has elements that are colors from the color spectrum" do
        new_code = Colorcode.new
        new_code.colors.each do |el|
          expect(el).to eq('red').or eq('green').or eq('yellow').or eq('blue').or eq('black').or eq('magenta').or eq('cyan').or eq('white')
        end
      end
    end

    #   it 'has 4 unique elements; no duplicates' do
    #     new_code = Colorcode.new
    #     expect(new_code.colors.any? { |el| new_code.colors.count(el) > 1 }).to be false
    #   end

    #   it 'does not have any empty strings as values' do
    #     new_code = Colorcode.new
    #     new_code.colors.each do |x|
    #       expect(x).to_not eq('')
    #     end
    #   end
    # end

  end
end
