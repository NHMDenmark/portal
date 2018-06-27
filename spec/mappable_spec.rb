# frozen_string_literal: true

require 'rdf'
require 'mongoid'
require_relative '../lib/mappable'

TEST_VOCAB = RDF::Vocabulary.new 'http://example.org/spec'

# Dummy Model to test the mixin.
class TestModel
  include Mongoid::Document
  extend Mappable

  field :a_field, as: :tv_a_term, label: TEST_VOCAB['aTerm'], type: String
  field :b_field, as: :tv_b_term, label: TEST_VOCAB['bTerm'], type: String
end

RSpec.describe Mappable do
  describe '.field_for_term' do
    context 'when passed a mapped a RDF Vocabulary term' do
      it 'returns the Mongoid::Field::Standard instance' do
        element = TEST_VOCAB['aTerm']
        expect(TestModel.field_for_term(element))
          .to be_a(Mongoid::Fields::Standard) & have_attributes(name: 'a_field')
      end
    end

    context 'when passed a RDF Vocabulary term that is not mapped' do
      it 'returns nil' do
        element = TEST_VOCAB['notMapped']
        expect(TestModel.field_for_term(element)).to be_nil
      end
    end
  end

  describe '.term_for_field' do
  	context 'when passed a labeled field name' do
      it 'returns the RDF Vocabulary term' do
      	expect(TestModel.term_for_field(:a_field)).to eq TEST_VOCAB['aTerm']
      end
  	end

  	context 'when passed a non-labeled field name' do
  		it 'returns nil' do
  			expect(TestModel.term_for_field(:no_field)).to be_nil
  		end
  	end
  end
end
