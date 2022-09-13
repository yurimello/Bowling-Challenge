require 'spec_helper'
require_relative '../../../../lib/validator/validator'

RSpec.describe Validator::NumberRangeValidator do
  subject(:validation) { validator.validate(on, number, options) }

  let(:validator) { described_class.new }
  let(:on) { :number }
  let(:options) { { min: 0, max: 10 } }

  context 'when number is inside the range' do
    let(:number) { 5 }

    it 'is valid', :aggregate_failures do
      expect(validation).to be_valid
      expect(validation.error).to be_nil
      expect(validation.exception).to be_nil
    end
  end

  context 'when number is outside the range' do
    let(:number) { -5 }

    it 'is invalid', :aggregate_failures do
      expect(validation).not_to be_valid
      expect(validation.error).to eq("Number #{number} is out of range on #{on}")
      expect(validation.exception).to eq(Validator::NumberOutOfRangeError)
    end
  end

  context 'when min option is omited' do
    let(:options) { { max: 10 } }
    let(:number) { 0 }

    it 'is valid', :aggregate_failures do
      expect(validation).to be_valid
      expect(validation.error).to be_nil
      expect(validation.exception).to be_nil
    end
  end
end
