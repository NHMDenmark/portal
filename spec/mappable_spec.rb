# frozen_string_literal: true

require 'rdf'
require 'mongoid'
require_relative '../lib/mappable'

TEST_VOCAB = RDF::Vocabulary.new 'http://example.org/spec/'

# Dummy Model to test the mixin.
class TestModel
  include Mongoid::Document
  extend Mappable

  field :a_field, as: :tv_a_term, label: TEST_VOCAB['aTerm'], type: String
  field :b_field, as: :tv_b_term, label: TEST_VOCAB['bTerm'], type: String
end

RSpec.describe Mappable do
  describe '.field_for_term' do
    context 'when passed a mapped RDF Vocabulary term' do
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

  describe '.field_for_uri' do
    context 'when passed a mapped URI' do
      it 'returns the Mongoid::Field::Standard instance' do
        element = 'http://example.org/spec/aTerm'
        expect(TestModel.field_for_uri(element))
          .to be_a(Mongoid::Fields::Standard) & have_attributes(name: 'a_field')
      end
    end

    context 'when passes a URI that is not mapped' do
    	it 'returns nil' do
    		element = 'http://example.org/spec/notMapped'
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

  describe '@rdf_class_term' do
  	it 'provides an accessor to the RDF class term' do
  	  TestModel.rdf_class_term = TEST_VOCAB['AnOntologicalClass']
  	  expect(TestModel.rdf_class_term).to be TEST_VOCAB['AnOntologicalClass']
  	end
  end
end
