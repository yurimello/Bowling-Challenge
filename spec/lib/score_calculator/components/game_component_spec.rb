require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe GameComponent do
  subject(:game_component) { described_class.new }

  let(:player) { instance_double(PlayerComponent, { 'parent=' => game_component }) }
  let(:add_player) { game_component.add(player) }

  context 'with player' do
    it 'is valid' do
      expect(add_player).to be_valid
    end
  end

  context 'without player' do
    it 'is invalid' do
      expect(game_component).not_to be_valid
    end
  end
end
