require 'spec_helper'

module Mastermind
    RSpec.describe Colorcode do
        context "#initialize" do
            it "is initialized with 4 parameters" do
                expect(Colorcode).to respond_to(:new).with(4).arguments
            end

            it "responds to #selected_colors" do
                code = Colorcode.new
                expect(code).to respond_to(:selected_colors)
            end

            it "passes four elements to @colors array" do
                code = Colorcode.new
                expect(code.selected_colors.length).to eq(4)
            end

            it "can be passed 4 user-generated values" do
                new_code = Colorcode.new("one", "two", "three", "four")
                expect(new_code.colors).to eq(["one", "two", "three", "four"])
            end

            it "assigns an array to @colors" do
                new_code = Colorcode.new
                expect(new_code.colors).to be_instance_of(Array)
            end

        end

        context "#colors" do
            it "has elements that are 1 of 8 colors from ROYGBIV" do
                new_code = Colorcode.new
                possible_colors = %w(red orange yellow green blue indigo violet)
                new_code.colors.each do |x|
                    expect(possible_colors.include?(x)).to be true
                end
            end
        end

        context "#selected_colors" do
        end


    end

end
