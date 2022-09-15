require 'spec_helper'
require_relative '../../../../lib/score_calculator/score_calculator'

RSpec.describe RollComponent do
  subject(:roll_component) { described_class.new }

  context 'with valid score' do
    let(:score) { 10 }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).to be_valid
    end
  end

  context 'with negative score' do
    let(:score) { -10 }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).not_to be_valid
    end
  end

  context 'with exceedent score' do
    let(:score) { 15 }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).not_to be_valid
    end
  end

  context 'with null score' do
    let(:score) { nil }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).not_to be_valid
    end
  end

  context 'with blank score' do
    let(:score) { '' }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).not_to be_valid
    end
  end

  context 'with string score' do
    let(:score) { 'ten' }

    it 'is valid' do
      expect(roll_component.add(score).run_validations).not_to be_valid
    end
  end
end
