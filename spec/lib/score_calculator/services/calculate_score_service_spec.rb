require 'spec_helper'
require 'json'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe CalculateScoreService do
  include FileFixtures
  subject(:frames) { service_response.children.map(&:children).flatten }

  let(:service_response) { service.response }

  let(:service) { described_class.call(game) }
  let(:hash) { JSON.parse(File.read(file_fixture(fixture))) }

  # TODO: should change to use factory bot instead of real class
  let(:game) { CreateGameService.call(hash).response }
  let(:fixture) { '' }

  context 'with perfect game' do
    let(:fixture) { 'perfect.json' }

    it { expect(frames.map(&:score)).to include(300) }
  end

  context 'when last frame has neither strike or spare' do
    let(:fixture) { 'last_frame_without_strike_or_spare.json' }

    it { expect(frames.map(&:score)).to include(269) }
  end

  context 'when last frame is a spare' do
    let(:fixture) { 'last_frame_spare.json' }

    it { expect(frames.map(&:score)).to include(280) }
  end
end
