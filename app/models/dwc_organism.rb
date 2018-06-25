# frozen_string_literal: true

# Embedded model for DwC Organism.
# http://rs.tdwg.org/dwc/terms/Organism
# A particular organism or defined group of organisms considered to be
# taxonomically homogeneous.
class DwcOrganism
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/organismID
  # An identifier for the Organism instance (as opposed to a particular digital
  # record of the Organism). May be a globally unique identifier or an
  # identifier specific to the data set.
  field :organism_id, as: :dwc_organism_id, type: String

  # http://rs.tdwg.org/dwc/terms/organismName
  # A textual name or label assigned to an Organism instance.
  field :organism_name, as: :dwc_organism_name, type: String

  # http://rs.tdwg.org/dwc/terms/organismScope
  # A description of the kind of Organism instance. Can be used to indicate
  # whether the Organism instance represents a discrete organism or if it
  # represents a particular type of aggregation.
  field :organism_scope, as: :dwc_organism_scope, type: String

  # http://rs.tdwg.org/dwc/terms/associatedOccurrences
  # A list (concatenated and separated) of identifiers of other Occurrence
  # records and their associations to this Occurrence.
  field :associated_occurrences, as: :dwc_associated_occurrences, type: String

  # http://rs.tdwg.org/dwc/terms/associatedOrganisms
  # A list (concatenated and separated) of identifiers of other Organisms and
  # their associations to this Organism.
  field :associated_organisms, as: :dwc_associated_organisms, type: String

  # CSPP :scientifcNameOriginal
  # http://rs.tdwg.org/dwc/terms/previousIdentifications
  # A list (concatenated and separated) of previous assignments of names to the
  # Organism.
  field :scientific_name_original, as: :dwc_previous_identifications,
                                   type: String

  # http://rs.tdwg.org/dwc/terms/organismRemarks
  # Comments or notes about the Organism instance.
  field :remarks, as: :dwc_organism_remarks, type: String
end
