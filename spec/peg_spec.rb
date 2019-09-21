# frozen_string_literal: true

require 'spec_helper'

module Mastermind
  RSpec.describe Peg do
    context '#initialize' do
      it "creates a new peg with ('') by default" do
        peg = Peg.new
        expect(peg.color).to eq('')
      end
    end
  end
end
