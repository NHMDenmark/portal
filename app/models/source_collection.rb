# frozen_string_literal: true

# Model for a biological collection
class SourceCollection
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  has_many :collection_objects

  # An identifier for the collection or dataset from which the record was
  # derived.
  # TODO: use an URI from a collections registry such as the Global Registry of
  # Biodiversity Repositories (http://grbio.org/).
  field :collection_id,
        as: :dwc_collection_id,
        label: RDF::Vocab::DWC['collectionID'],
        type: String

  # The name, acronym, coden, or initialism identifying the collection or data
  # set from which the record was derived.
  field :collection_code,
        as: :dwc_collection_code,
        label: RDF::Vocab::DWC['collectionCode'],
        type: String
  field :_id, type: String, overwrite: true, default: -> { collection_code }

  # An identifier for the institution having custody of the object(s) or
  # information referred to in the record.
  field :institution_id,
        as: :dwc_institution_id,
        label: RDF::Vocab::DWC['institutionID'],
        type: String

  # The name (or acronym) in use by the institution having custody of the
  # object(s) or information referred to in the record.
  field :institution_code,
        as: :dwc_institution_code,
        label: RDF::Vocab::DWC['institutionCode'],
        type: String

  self.template_query_field(:collection_id, { unique: true })
  self.template_query_field(:collection_code, { unique: true })
end
