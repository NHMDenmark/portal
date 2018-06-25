# frozen_string_literal: true

# Model for a biological collection
class SourceCollection
  include Mongoid::Document

  has_many :collection_objects

  # http://rs.tdwg.org/dwc/terms/collectionID
  # An identifier for the collection or dataset from which the record was
  # derived.
  # TODO: use an URI from a collections registry such as the Global Registry of
  # Biodiversity Repositories (http://grbio.org/).
  field :collection_id, as: :dwc_collection_id, type: String

  # http://rs.tdwg.org/dwc/terms/collectionCode
  # The name, acronym, coden, or initialism identifying the collection or data
  # set from which the record was derived.
  field :collection_code, as: :dwc_collection_code, type: String
  field :_id, type: String, overwrite: true, default: -> { collection_code }

  # http://rs.tdwg.org/dwc/terms/institutionID
  # An identifier for the institution having custody of the object(s) or
  # information referred to in the record.
  field :institution_id, as: :dwc_institution_id, type: String

  # http://rs.tdwg.org/dwc/terms/institutionCode
  # The name (or acronym) in use by the institution having custody of the
  # object(s) or information referred to in the record.
  field :institution_code, as: :dwc_institution_code, type: String

  index({ collection_id: 1 }, unique: true)
  index({ collection_code: 1 }, unique: true)
end
