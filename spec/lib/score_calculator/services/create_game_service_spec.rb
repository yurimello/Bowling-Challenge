require 'spec_helper'
require 'json'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe CreateGameService do
  include FileFixtures
  subject(:service_response) { service.response }

  let(:service) { described_class.call(hash) }
  let(:file) { File.read(file_fixture(fixture)) }
  let(:hash) { JSON.parse(file) }
  let(:fixture) { '' }

  context 'with perfect game' do
    let(:fixture) { 'perfect.json' }

    it { expect(service_response).to be_valid }
  end

  context 'when last frame has neither strike or spare' do
    let(:fixture) { 'last_frame_without_strike_or_spare.json' }

    it { expect(service_response).to be_valid }
  end

  context 'when last frame is a spare' do
    let(:fixture) { 'last_frame_spare.json' }

    it { expect(service_response).to be_valid }
  end

  context 'with two players' do
    let(:fixture) { 'scores.json' }

    it { expect(service_response).to be_valid }
  end

  context 'with three players' do
    let(:fixture) { 'three_players.json' }

    it { expect(service_response).to be_valid }
  end

  context 'with negative score' do
    let(:fixture) { 'negative.json' }

    it { expect { service_response }.to raise_error(Validator::NumberOutOfRangeError) }
  end

  context 'with extra score' do
    let(:fixture) { 'extra-score.json' }

    it { expect { service_response }.to raise_error(Validator::InvalidStrike) }
  end

  context 'with empty matrix' do
    let(:fixture) { 'empty.json' }

    it { expect { service_response }.to raise_error(Validator::InsufficientPlayersError) }
  end

  context 'with invalid score' do
    let(:fixture) { 'invalid-score.json' }

    it { expect { service_response }.to raise_error(Validator::InsufficientPlayersError) }
  end

  context 'with free text' do
    let(:fixture) { 'free-text.json' }

    it { expect { service_response }.to raise_error(Validator::InsufficientPlayersError) }
  end
end
