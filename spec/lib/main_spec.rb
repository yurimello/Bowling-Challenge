require 'spec_helper'
require 'main'

RSpec.describe Main do
  subject(:main) { described_class.call(file_path).to_s.gsub(pattern, '') }

  let(:file_path) { file_fixture(fixture) }
  let(:fixture) { '' }
  let(:expected_output) { File.read("./spec/fixtures/outputs/#{fixture}").to_s.gsub(pattern, '') }
  let(:pattern) { /(\n|\t)*/ }

  context 'when input file is valid' do
    context 'with more than two players' do
      let(:fixture) { 'three_players.txt' }

      it 'prints the game scoreboard to stdout', :aggregate_failures do
        expect(main).to eq(expected_output)
      end
    end

    context 'with strikes in all throwings' do
      let(:fixture) { 'perfect.txt' }

      it 'prints a perfect game scoreboard' do
        expect(main).to eq(expected_output)
      end
    end

    context 'when last frame has a spare' do
      let(:fixture) { 'last_frame_spare.txt' }

      it 'prints an almost perfect game scoreboard' do
        expect(main).to eq(expected_output)
      end
    end

    context 'with fouls in all throwings' do
      let(:fixture) { 'all_fouls.txt' }

      it 'prints the game scoreboard to stdout' do
        expect(main).to eq(expected_output)
      end
    end
  end

  context 'when input file is invalid' do
    context 'with invalid characters present' do
      let(:fixture) { 'invalid-score.txt' }

      it { expect { main }.to raise_error(Validator::StringDoesNotMatch) }
    end

    context 'with invalid score' do
      let(:fixture) { 'negative.txt' }

      it { expect { main }.to raise_error(Validator::NumberOutOfRangeError) }
    end

    context 'with invalid number of throwings' do
      let(:fixture) { 'extra-score.txt' }

      it { expect { main }.to raise_error(Validator::InvalidStrike) }
    end
  end
end
