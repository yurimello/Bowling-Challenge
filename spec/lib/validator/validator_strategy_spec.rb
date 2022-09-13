require 'spec_helper'
require_relative '../../../../lib/validator/validator'

RSpec.describe Validator::ValidatorStrategy do
  subject(:strategy) { described_class.new }

  context 'with valid validator' do
    let(:validator) { :number_range }

    it 'returns NumberRangeValidator object' do
      expect(strategy.validation(validator)).to be_kind_of(Validator::NumberRangeValidator)
    end
  end

  context 'with invalid validator' do
    let(:validator) { :invalid }

    it 'raises MissingValidatorError error' do
      expect { strategy.validation(validator) }.to raise_error(Validator::MissingValidatorError)
    end
  end
end
