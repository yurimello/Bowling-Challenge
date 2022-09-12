require 'spec_helper'
require 'main'

RSpec.describe Main do
  subject(:main) { described_class }
  let(:game) { file_fixture('perfect.txt') }

  context 'when input file is valid' do
    context 'with more than two players' do
      it 'prints the game scoreboard to stdout' do
        expect { main.caluclate_score(game) }.to output(/300/).to_stdout
      end
    end

    context 'with strikes in all throwings' do
      xit 'prints a perfect game scoreboard' do
      end
    end

    context 'with fouls in all throwings' do
      xit 'prints the game scoreboard to stdout' do
      end
    end
  end

  context 'when input file is invalid' do
    context 'with invalid characters present' do
      xit 'raises the corresponding error message' do
      end
    end

    context 'with invalid score' do
      xit 'raises the corresponding error message' do
      end
    end

    context 'with invalid number of throwings' do
      xit 'raises the corresponding error message' do
      end
    end
  end
end
