require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe LastFrameComponent do
  subject(:frame_component) { described_class.new }

  let(:roll1) { instance_double(RollComponent, { score: score1, 'parent=' => frame_component }) }
  let(:roll2) { instance_double(RollComponent, { score: score2, 'parent=' => frame_component }) }
  let(:roll3) { instance_double(RollComponent, { score: score3, 'parent=' => frame_component }) }
  let(:score1) { 10 }
  let(:score2) { 10 }
  let(:score3) { 10 }
  let(:add_component) do
    frame_component.add(roll1)
    frame_component.add(roll2)
    frame_component.add(roll3)
    frame_component.run_validations
  end

  context 'with all strikes' do
    it 'is valid' do
      expect(add_component).to be_valid
    end
  end

  context 'when last one is not a strike' do
    let(:score3) { 3 }

    it 'is valid' do
      expect(add_component).to be_valid
    end
  end

  context 'when only the first one is a strike' do
    let(:score2) { 3 }
    let(:score3) { 3 }

    it 'is valid' do
      expect(add_component).to be_valid
    end
  end

  context 'when none is a strike' do
    let(:score1) { 3 }
    let(:score2) { 3 }
    let(:score3) { 3 }

    it 'is invalid' do
      expect(add_component).not_to be_valid
    end
  end

  context 'with only one roll and it is a strike' do
    let(:add_component) do
      frame_component.add(roll1)
      frame_component.run_validations
    end

    it 'is invalid' do
      expect(add_component).not_to be_valid
    end
  end
end
