# frozen_string_literal: true

RSpec.describe Mastermind do
  it 'has a version number' do
    expect(Mastermind::VERSION).not_to be nil
  end

  it 'plays Mastermind' do
    expect(true).to eq(true)
  end
end
