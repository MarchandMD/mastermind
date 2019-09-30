# frozen_string_literal: true

require "spec_helper"

module Mastermind
  RSpec.describe Colorcode do
    context "#initialize" do
      it "is initialized with 4 parameters" do
        expect(Colorcode).to respond_to(:new).with(4).arguments
      end

      it "can be passed 4 user-generated values" do
        new_code = Colorcode.new("one", "two", "three", "four")
        expect(new_code.colors).to eq(%w[one two three four])
      end

      it "assigns an array to @colors" do
        new_code = Colorcode.new
        expect(new_code.colors).to be_instance_of(Array)
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
