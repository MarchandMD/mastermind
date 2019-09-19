require 'spec_helper'

module Mastermind

    RSpec.describe SecretCode do

        context "#initialize" do
          it "responds to #solution" do
            new_code = SecretCode.new
            expect(new_code).to respond_to(:solution)
          end

          it "can accept a user-supplied parameter" do
            new_code = SecretCode.new("green")
            expect(new_code.solution).to eq("green")
          end

        end

    end
end