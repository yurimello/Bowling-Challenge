require 'spec_helper'
require_relative '../../../lib/file_parser/file_parser'

RSpec.describe FileParser do
  include FileFixtures
  subject(:file_parser) { described_class.call(file_path) }

  let(:file_path) { file_fixture(fixture) }
  let(:fixture) { '' }

  context 'with perfect game' do
    let(:fixture) { 'perfect.txt' }

    it 'returns a matrix' do
      expect(file_parser.size).to eq(12)
    end
  end

  context 'with empty file' do
    let(:fixture) { 'empty.txt' }

    it 'returns a matrix' do
      expect(file_parser.size).to eq(0)
    end
  end

  context 'with not found file' do
    let(:file_path) { 'not-found.txt' }

    it { expect { file_parser }.to raise_error(Validator::NotFoundFileError) }
  end

  context 'with invalid format' do
    let(:fixture) { 'invalid_format.rb' }

    it { expect { file_parser }.to raise_error(Validator::InvalidFormatError) }
  end
end
