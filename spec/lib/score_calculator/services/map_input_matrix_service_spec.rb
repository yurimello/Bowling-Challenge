require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe MapInputMatrixService do
  include MatrixFixtures
  subject(:service_response) { service.response }

  let(:service) { described_class.call(matrix) }
  let(:matrix) { matrix_fixture(fixture) }
  let(:fixture) { '' }

  context 'with perfect game' do
    let(:fixture) { 'perfect.txt' }

    it 'responds a hash with 1 player and 10 frames', :aggregate_failures do
      expect(service_response.keys.size).to eq(1)
      expect(service_response.values.first.size).to eq(10)
      expect(service_response.values.first.last.size).to eq(3)
      expect(service_response.values.first.flatten.sum).to eq(120)
    end
  end

  context 'with two players' do
    let(:fixture) { 'scores.txt' }

    it 'responds a hash with 2 players and 10 frames each', :aggregate_failures do
      expect(service_response.values[0].size).to eq(10)
      expect(service_response.values[1].size).to eq(10)
      expect(service_response.values[0].last.size).to eq(3)
      expect(service_response.values[1].last.size).to eq(3)
    end
  end

  context 'with three players' do
    let(:fixture) { 'three_players.txt' }

    it 'responds a hash with 3 players and 10 frames each', :aggregate_failures do
      expect(service_response.keys.size).to eq(3)
      expect(service_response.values[0].size).to eq(10)
      expect(service_response.values[2].size).to eq(10)
      expect(service_response.values[0].last.size).to eq(3)
      expect(service_response.values[2].last.size).to eq(3)
    end
  end

  context 'with negative score' do
    let(:fixture) { 'negative.txt' }

    it 'responds a hash with 1 player and 10 frames', :aggregate_failures do
      expect(service_response.keys.size).to eq(1)
      expect(service_response.values.first.size).to eq(10)
      expect(service_response.values.first.last.size).to eq(2)
      expect(service_response.values.first.flatten.sum).to eq(105)
    end
  end

  context 'with extra score' do
    let(:fixture) { 'extra-score.txt' }

    it 'responds a hash with 1 player and 10 frames', :aggregate_failures do
      expect(service_response.keys.size).to eq(1)
      expect(service_response.values.first.size).to eq(10)
      expect(service_response.values.first.last.size).to eq(4)
      expect(service_response.values.first.flatten.sum).to eq(125)
    end
  end

  context 'with empty matrix' do
    let(:fixture) { 'empty.txt' }

    it { expect { service_response }.to raise_error(Validator::EmptyArrayError) }
  end

  context 'with invalid score' do
    let(:fixture) { 'invalid-score.txt' }

    it { expect { service_response }.to raise_error(Validator::StringDoesNotMatch) }
  end

  context 'with free text' do
    let(:fixture) { 'free-text.txt' }

    it { expect { service_response }.to raise_error(Validator::NumberOutOfRangeError) }
  end
end
