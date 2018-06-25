# frozen_string_literal: true

# Embedded model for DwC Identification.
# http://rs.tdwg.org/dwc/terms/GeologicalContext
# Geological information, such as stratigraphy, that qualifies a region or
# place.
class DwcGeologicalContext
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/geologicalContextID
  # An identifier for the set of information associated with a GeologicalContext
  # (the location within a geological context, such as stratigraphy). May be a
  # global unique identifier or an identifier specific to the data set.
  field :geological_context_id, as: :dwc_geological_context_id, type: String

  # http://rs.tdwg.org/dwc/terms/earliestEonOrLowestEonothem
  # The full name of the earliest possible geochronologic eon or lowest
  # chrono-stratigraphic eonothem or the informal name ("Precambrian")
  # attributable to the stratigraphic horizon from which the cataloged item was
  # collected.
  field :earliest_eon_or_lowest_eonothem,
        as: :dwc_earliest_eon_or_lowest_eonothem, type: String

  # http://rs.tdwg.org/dwc/terms/latestEonOrHighestEonothem
  # The full name of the latest possible geochronologic eon or highest
  # chrono-stratigraphic eonothem or the informal name ("Precambrian")
  # attributable to the stratigraphic horizon from which the cataloged item was
  # collected.
  field :latest_eon_or_highest_eonothem,
        as: :dwc_latest_eon_or_highest_eonothem, type: String

  # http://rs.tdwg.org/dwc/terms/earliestEraOrLowestErathem
  # The full name of the earliest possible geochronologic era or lowest
  # chronostratigraphic erathem attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :earliest_era_or_lowest_erathem,
        as: :dwc_earliest_era_or_lowest_erathem, type: String

  # http://rs.tdwg.org/dwc/terms/latestEraOrHighestErathem
  # The full name of the latest possible geochronologic era or highest
  # chronostratigraphic erathem attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :latest_era_or_highest_erathem,
        as: :dwc_latest_era_or_highest_erathem, type: String

  # http://rs.tdwg.org/dwc/terms/earliestPeriodOrLowestSystem
  # The full name of the earliest possible geochronologic period or lowest
  # chronostratigraphic system attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :earliest_period_or_lowest_system,
        as: :dwc_earliest_period_or_lowest_system, type: String

  # http://rs.tdwg.org/dwc/terms/latestPeriodOrHighestSystem
  # The full name of the latest possible geochronologic period or highest
  # chronostratigraphic system attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :latest_period_or_highest_system,
        as: :dwc_latest_period_or_highest_system, type: String

  # http://rs.tdwg.org/dwc/terms/earliestEpochOrLowestSeries
  # The full name of the earliest possible geochronologic epoch or lowest
  # chronostratigraphic series attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :earliest_epoch_or_lowest_series,
        as: :dwc_earliest_epoch_or_lowest_series, type: String

  # http://rs.tdwg.org/dwc/terms/latestEpochOrHighestSeries
  # The full name of the latest possible geochronologic epoch or highest
  # chronostratigraphic series attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :latest_epoch_or_highest_series,
        as: :dwc_latest_epoch_or_highest_series, type: String

  # http://rs.tdwg.org/dwc/terms/earliestAgeOrLowestStage
  # The full name of the earliest possible geochronologic age or lowest
  # chronostratigraphic stage attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :earliest_age_or_lowest_stage,
        as: :dwc_earliest_age_or_lowest_stage, type: String

  # http://rs.tdwg.org/dwc/terms/latestAgeOrHighestStage
  # The full name of the latest possible geochronologic age or highest
  # chronostratigraphic stage attributable to the stratigraphic horizon from
  # which the cataloged item was collected.
  field :latest_age_or_highest_stage,
        as: :dwc_latest_age_or_highest_stage, type: String

  # http://rs.tdwg.org/dwc/terms/lowestBiostratigraphicZone
  # The full name of the lowest possible geological biostratigraphic zone of the
  # stratigraphic horizon from which the cataloged item was collected.
  field :lowest_biostratigraphic_zone,
        as: :dwc_lowest_biostratigraphic_zone, type: String

  # http://rs.tdwg.org/dwc/terms/highestBiostratigraphicZone
  # The full name of the highest possible geological biostratigraphic zone of
  # the stratigraphic horizon from which the cataloged item was collected.
  field :highest_biostratigraphic_zone,
        as: :dwc_highest_biostratigraphic_zone, type: String

  # http://rs.tdwg.org/dwc/terms/lithostratigraphicTerms
  # The combination of all litho-stratigraphic names for the rock from which the
  # cataloged item was collected.
  field :lithostratigraphy, as: :dwc_lithostratigraphic_terms, type: String

  # http://rs.tdwg.org/dwc/terms/group
  # The full name of the lithostratigraphic group from which the cataloged item
  # was collected.
  field :group, as: :dwc_group, type: String

  # http://rs.tdwg.org/dwc/terms/formation
  # The full name of the lithostratigraphic formation from which the cataloged
  # item was collected.
  field :formation, as: :dwc_formation, type: String

  # http://rs.tdwg.org/dwc/terms/member
  # The full name of the lithostratigraphic member from which the cataloged item
  # was collected.
  field :member, as: :dwc_member, type: String

  # http://rs.tdwg.org/dwc/terms/bed
  # The full name of the lithostratigraphic bed from which the cataloged item
  # was collected.
  field :bed, as: :dwc_bed, type: String
end
