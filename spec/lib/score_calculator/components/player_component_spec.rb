require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe PlayerComponent do
  subject(:player_component) { described_class.new }

  let(:name) { 'Player' }
  let(:add_frames) do
    10.times do
      frame = instance_double(FrameComponent, { 'parent=' => player_component })
      player_component.add(frame)
    end
    player_component
  end

  context 'with name and frames' do
    before do
      player_component.name = name
    end

    it 'is valid' do
      expect(add_frames).to be_valid
    end
  end

  context 'without name but with frames' do
    it 'is invalid' do
      expect(add_frames).not_to be_valid
    end
  end
end
