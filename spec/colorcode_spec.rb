require 'spec_helper'

module Mastermind
    RSpec.describe Colorcode do
        context "#initialize" do
            it "is initialized with 4 parameters" do
                code = Colorcode.new("red")
                expect(code.colors.size).to eq(4)
                expect(code.colors[0]).to eq("red")
                #expect(code.colors[1]).to eq(nil)
            end

            it "adds at least one element to the @selected_colors instance variable" do
                code = Colorcode.new
                expect(code.selected_colors).to_not be_empty
            end

            it "adds a color to the @selected_colors array" do
                colors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
                code = Colorcode.new
                expect(colors).to include(code.selected_colors[0])
            end

            it "adds four colors to the @selected_colors array" do
                code = Colorcode.new
                expect(code.selected_colors.length).to eq(4)
            end

        end
    end

end
