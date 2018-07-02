# frozen_string_literal: true

# Embedded model for DwC Organism.
# A particular organism or defined group of organisms considered to be
# taxonomically homogeneous.
class DwcOrganism
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  self.rdf_class_term = RDF::Vocab::DWC['Organism']

  embedded_in :collection_object

  # An identifier for the Organism instance (as opposed to a particular digital
  # record of the Organism). May be a globally unique identifier or an
  # identifier specific to the data set.
  field :organism_id,
        as: :dwc_organism_id,
        label: RDF::Vocab::DWC['organismID'],
        type: String

  # A textual name or label assigned to an Organism instance.
  field :organism_name,
        as: :dwc_organism_name,
        label: RDF::Vocab::DWC['organismName'],
        type: String

  # A description of the kind of Organism instance. Can be used to indicate
  # whether the Organism instance represents a discrete organism or if it
  # represents a particular type of aggregation.
  field :organism_scope,
        as: :dwc_organism_scope,
        label: RDF::Vocab::DWC['organismScope'],
        type: String

  # A list (concatenated and separated) of identifiers of other Occurrence
  # records and their associations to this Occurrence.
  field :associated_occurrences,
        as: :dwc_associated_occurrences,
        label: RDF::Vocab::DWC['associatedOccurrences'],
        type: String

  # A list (concatenated and separated) of identifiers of other Organisms and
  # their associations to this Organism.
  field :associated_organisms,
        as: :dwc_associated_organisms,
        label: RDF::Vocab::DWC['associatedOrganisms'],
        type: String

  # CSPP :scientifcNameOriginal
  # A list (concatenated and separated) of previous assignments of names to the
  # Organism.
  field :scientific_name_original,
        as: :dwc_previous_identifications,
        label: RDF::Vocab::DWC['previousIdentifications'],
        type: String

  # Comments or notes about the Organism instance.
  field :remarks,
        as: :dwc_organism_remarks,
        label: RDF::Vocab::DWC['organismRemarks'],
        type: String
end
