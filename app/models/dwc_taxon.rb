# frozen_string_literal: true

# Embedded model for DwC Taxon.
# http://rs.tdwg.org/dwc/terms/Taxon
class DwcTaxon
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/taxonID
  # An identifier for the set of taxon information (data associated with the
  # Taxon class). May be a global unique identifier or an identifier specific to
  # the data set.
  field :taxon_id, as: :dwc_taxon_id, type: String

  # http://rs.tdwg.org/dwc/terms/scientificNameID
  # An identifier for the nomenclatural (not taxonomic) details of a scientific
  # name.
  field :scientific_name_id, as: :dwc_scientific_name_id, type: String

  # http://rs.tdwg.org/dwc/terms/acceptedNameUsageID
  # An identifier for the name usage (documented meaning of the name according
  # to a source) of the currently valid (zoological) or accepted (botanical)
  # taxon.
  field :accepted_name_usage_id, as: :dwc_accepted_name_usage_id, type: String

  # http://rs.tdwg.org/dwc/terms/parentNameUsageID
  # An identifier for the name usage (documented meaning of the name according
  # to a source) of the direct, most proximate higher-rank parent taxon (in a
  # classification) of the most specific element of the scientificName.
  field :parent_name_usage_id, as: :dwc_parent_name_usage_id, type: String

  # http://rs.tdwg.org/dwc/terms/originalNameUsageID
  # An identifier for the name usage (documented meaning of the name according
  # to a source) in which the terminal element of the scientificName was
  # originally established under the rules of the associated nomenclaturalCode.
  field :original_name_usage_id, as: :dwc_original_name_usage_id, type: String

  # http://rs.tdwg.org/dwc/terms/nameAccordingToID
  # An identifier for the source in which the specific taxon concept
  #  circumscription is defined or implied. See nameAccordingTo.
  field :name_according_to_id, as: :dwc_name_according_to_id, type: String

  # http://rs.tdwg.org/dwc/terms/namePublishedInID
  # An identifier for the publication in which the scientificName was originally
  # established under the rules of the associated nomenclaturalCode.
  field :name_published_in_id, as: :dwc_name_published_in_id, type: String

  # http://rs.tdwg.org/dwc/terms/taxonConceptID
  # An identifier for the taxonomic concept to which the record refers - not for
  # the nomenclatural details of a taxon.
  field :taxon_concept_id, as: :dwc_taxon_concept_id, type: String

  # CSPP :scientificNameCurrent
  # http://rs.tdwg.org/dwc/terms/scientificName
  # The full scientific name, with authorship and date information if known.
  # When forming part of an Identification, this should be the name in lowest
  # level taxonomic rank that can be determined.
  field :scientific_name_current, as: :dwc_scientific_name, type: String

  # http://rs.tdwg.org/dwc/terms/acceptedNameUsage
  # The full name, with authorship and date information if known, of the
  # currently valid (zoological) or accepted (botanical) taxon.
  field :accepted_name_usage, as: :dwc_accepted_name_usage, type: String

  # http://rs.tdwg.org/dwc/terms/parentNameUsage
  # The full name, with authorship and date information if known, of the direct,
  # most proximate higher-rank parent taxon (in a classification) of the most
  # specific element of the scientificName.
  field :parent_name_usage, as: :dwc_parent_name_usage, type: String

  # http://rs.tdwg.org/dwc/terms/originalNameUsage
  # The taxon name, with authorship and date information if known, as it
  # originally appeared when first established under the rules of the associated
  # nomenclaturalCode. The basionym (botany) or basonym (bacteriology) of the
  # scientificName or the senior/earlier homonym for replaced names.
  field :original_name_usage, as: :dwc_original_name_usage, type: String

  # http://rs.tdwg.org/dwc/terms/nameAccordingTo
  # The reference to the source in which the specific taxon concept
  # circumscription is defined or implied - traditionally signified by the Latin
  # "sensu" or "sec." (from secundum, meaning "according to"). For taxa that
  # result from identifications, a reference to the keys, monographs, experts
  # and other sources should be given.
  field :name_according_to, as: :dwc_name_according_to, type: String

  # http://rs.tdwg.org/dwc/terms/namePublishedIn
  # A reference for the publication in which the scientificName was originally
  # established under the rules of the associated nomenclaturalCode.
  field :name_published_in, as: :dwc_name_published_in, type: String

  # http://rs.tdwg.org/dwc/terms/namePublishedInYear
  # The four-digit year in which the scientificName was published.
  field :name_published_in_year, as: :dwc_name_published_in_year, type: Integer

  # http://rs.tdwg.org/dwc/terms/higherClassification
  # A list (concatenated and separated) of taxa names terminating at the rank
  # immediately superior to the taxon referenced in the taxon record.
  # TODO: generate default from classification fields (:kingdom, :phylum, etc)
  field :higher_classification, as: :dwc_higher_classification, type: String

  # http://rs.tdwg.org/dwc/terms/kingdom
  # The full scientific name of the kingdom in which the taxon is classified.
  field :kingdom, as: :dwc_kingdom, type: String

  # http://rs.tdwg.org/dwc/terms/phylum
  # The full scientific name of the phylum or division in which the taxon is
  # classified.
  field :phylum, as: :dwc_phylum, type: String

  # http://rs.tdwg.org/dwc/terms/class
  # The full scientific name of the class in which the taxon is classified.
  # FIXME: trailing underscore required to avoid namespace collision
  field :class_, as: :dwc_class, type: String

  # http://rs.tdwg.org/dwc/terms/order
  # The full scientific name of the order in which the taxon is classified.
  field :order, as: :dwc_order, type: String

  # CSPP :family
  # http://rs.tdwg.org/dwc/terms/family
  # The full scientific name of the family in which the taxon is classified.
  field :family, as: :dwc_family, type: String

  # http://rs.tdwg.org/dwc/terms/genus
  # The full scientific name of the genus in which the taxon is classified.
  field :genus, as: :dwc_genus, type: String

  # http://rs.tdwg.org/dwc/terms/subgenus
  # The full scientific name of the subgenus in which the taxon is classified.
  # Values should include the genus to avoid homonym confusion.
  # TODO: generate default including :genus
  field :subgenus, as: :dwc_subgenus, type: String

  # http://rs.tdwg.org/dwc/terms/specificEpithet
  # The name of the first or species epithet of the scientificName.
  field :specific_epithet, as: :dwc_specific_epithet, type: String

  # http://rs.tdwg.org/dwc/terms/infraspecificEpithet
  # The name of the lowest or terminal infraspecific epithet of the
  # scientificName, excluding any rank designation.
  field :infraspecific_epithet, as: :dwc_infraspecific_epithet, type: String

  # http://rs.tdwg.org/dwc/terms/taxonRank
  # The taxonomic rank of the most specific name in the scientificName.
  field :rank, as: :dwc_taxon_rank, type: String

  # http://rs.tdwg.org/dwc/terms/verbatimTaxonRank
  # The taxonomic rank of the most specific name in the scientificName as it
  # appears in the original record.
  field :verbatim_rank, as: :dwc_verbatim_taxon_rank, type: String

  # http://rs.tdwg.org/dwc/terms/scientificNameAuthorship
  # The authorship information for the scientificName formatted according to the
  # conventions of the applicable nomenclaturalCode.
  field :author, as: :dwc_scientific_name_authorship, type: String

  # http://rs.tdwg.org/dwc/terms/vernacularName
  # A common or vernacular name.
  field :vernacular_name, as: :dwc_vernacular_name, type: String

  # http://rs.tdwg.org/dwc/terms/nomenclaturalCode
  # The nomenclatural code (or codes in the case of an ambiregnal name) under
  # which the scientificName is constructed.
  field :nomenclatural_code, as: :dwc_nomenclatural_code, type: String

  # http://rs.tdwg.org/dwc/terms/taxonomicStatus
  # The status of the use of the scientificName as a label for a taxon. Requires
  # taxonomic opinion to define the scope of a taxon. Rules of priority then are
  # used to define the taxonomic status of the nomenclature contained in that
  # scope, combined with the experts opinion. It must be linked to a specific
  # taxonomic reference that defines the concept.
  field :taxonomic_status, as: :dwc_taxonomic_status, type: String

  # http://rs.tdwg.org/dwc/terms/nomenclaturalStatus
  # The status related to the original publication of the name and its
  # conformance to the relevant rules of nomenclature. It is based essentially
  # on an algorithm according to the business rules of the code. It requires no
  # taxonomic opinion.
  field :nomenclatural_status, as: :dwc_nomenclatural_status, type: String

  # http://rs.tdwg.org/dwc/terms/taxonRemarks
  # Comments or notes about the taxon or name.
  field :remarks, as: :dwc_taxon_remarks, type: String
end
