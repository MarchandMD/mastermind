module Mastermind

    class SecretCode

        attr_accessor :solution

        def initialize(solution = generate_code)
            @solution = solution
        end

        private

        def generate_code
            colors = %w(red orange yellow green blue indigo violet)
            colors.shuffle.pop(4)
        end


    end
end