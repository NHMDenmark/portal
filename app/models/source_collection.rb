# frozen_string_literal: true

# Model for a biological collection
class SourceCollection
  include Mongoid::Document

  has_many :collection_objects

  # For physical specimens, the recommended best practice is to use an
  # identifier from a collections registry such as the Global Registry of
  # Biodiversity Repositories (http://grbio.org/).
  # Examples: "http://biocol.org/urn:lsid:biocol.org:col:1001",
  #           "http://grbio.org/cool/p5fp-c036).
  field :dwc_collection_id, type: String

  # he name (or acronym) in use by the institution having custody of the object
  # or information referred to in the record.
  field :dwc_collection_code, type: String
  field :_id, type: String, overwrite: true, default: -> { dwc_collection_code }

  # For physical specimens, the recommended best practice is to use an
  # identifier from a collections registry such as the Global Registry of
  # Biodiversity Repositories (http://grbio.org/).
  # Examples: "http://biocol.org/urn:lsid:biocol.org:col:34777",
  #           "http://grbio.org/cool/km06-gtbn).
  field :dwc_institution_id, type: String

  field :dwc_institution_code, type: String

  index({ dwc_collection_id: 1 }, unique: true)
  index({ dwc_collection_code: 1 }, unique: true)
end
