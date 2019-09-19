require 'spec_helper'

module Mastermind

    RSpec.describe SecretCode do

        context "#initialize" do
          it "creates a new SecretCode object with a secret code by default" do
            new_code = SecretCode.new
            expect(new_code.solution).to_not be false
          end

          it "can accept a user-supplied parameter" do
            new_code = SecretCode.new("green")
            expect(new_code.solution).to eq("green")
          end

        end

    end
end