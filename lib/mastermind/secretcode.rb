# frozen_string_literal: true

module Mastermind
  class SecretCode
    attr_accessor :solution

    def initialize(solution = default_secret_code)
      @solution = solution
    end

    private

    def generate_code
      colors = %w[red orange yellow green blue indigo violet]
      colors.shuffle.pop(4)
    end

    def default_secret_code
      Array.new(4) { Peg.new }
    end
  end
end
