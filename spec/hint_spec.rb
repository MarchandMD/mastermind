# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Hint do
    context '#initialize' do
      it 'needs 4 parameters exactly' do
        expect { a_hint = Hint.new('white', 'white', 'white') }.to raise_error(ArgumentError)
      end
    end

    context '#colors' do
      it 'creates an array of elements set by the parameters of the constructor' do
        a_hint = Hint.new('white', 'white', 'white', 'white')
        expect(a_hint.colors).to eq(%w[white white white white])
      end
      it 'has 4 colors in it' do
        a_hint = Hint.new('white', 'white', 'white', 'white')
        expect(a_hint.colors.length).to eq(4)
      end

      it 'can access an individual element from itself' do
        a_hint = Hint.new('white', 'white', 'white', 'white')
        expect(a_hint.colors[0]).to eq('white')
      end
    end
  end
end
