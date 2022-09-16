require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe FrameComponent do
  subject(:frame_component) { described_class.new }

  let(:roll1) { instance_double(RollComponent, { score: score1, 'parent=' => frame_component, id: 1 }) }
  let(:roll2) { instance_double(RollComponent, { score: score2, 'parent=' => frame_component, id: 2 }) }
  let(:score1) { 3 }
  let(:score2) { 4 }
  let(:add_component) do
    frame_component.add(roll1)
    frame_component.add(roll2)
    frame_component.run_validations
  end

  context 'with valid rolls' do
    it 'is valid' do
      expect(add_component).to be_valid
    end
  end

  context 'without rolls' do
    let(:roll1) { nil }
    let(:roll2) { nil }

    it 'raises exception' do
      expect { add_component }.to raise_error(NoMethodError)
    end
  end

  context 'with 3 rolls' do
    let(:roll3) { instance_double(RollComponent, { score: score2, 'parent=' => frame_component, id: 3 }) }
    let(:add_three_components) do
      add_component
      frame_component.add(roll3)
      frame_component.run_validations
    end

    it 'is invalid' do
      expect(add_three_components).not_to be_valid
    end
  end

  context 'with invalid rolls score' do
    let(:score1) { 15 }

    it 'is valid' do
      expect(add_component).not_to be_valid
    end
  end

  context 'with invalid rolls strike' do
    let(:score1) { 10 }
    let(:score2) { 0 }

    it 'is invalid' do
      expect(add_component).not_to be_valid
    end
  end
end
