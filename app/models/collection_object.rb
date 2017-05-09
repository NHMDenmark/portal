class CollectionObject
  include Mongoid::Document
  belongs_to :source_collection
  field :mapping_id, type: Integer                      # mappingId
  field :dataset_name, type: String                     # datasetName
  field :access_rights, type: String                    # accessRights
  field :license, type: String                          # license
  field :basis_of_record, type: String                  # basisOfRecord
  field :catalog_number, type: String                   # catalogNumber
  field :other_catalog_numbers, type: String            # otherCatalogNumbers
  field :field_number, type: String                     # fieldNumber
  field :order, type: String                            # order
  field :family, type: String                           # family
  field :genus, type: String                            # genus
  field :specific_epithet, type: String                 # specificEpithet
  field :infraspecific_epithet, type: String            # infraspecificEpithet
  field :scientific_name, type: String                  # scientificName
  field :type_status, type: String                      # typeStatus
  field :continent, type: String                        # continent
  field :country, type: String                          # country
  field :state_province, type: String                   # stateProvince
  field :county, type: String                           # county
  field :higher_geography, type: String                 # higherGeography
  field :island_group, type: String                     # islandGroup
  field :island, type: String                           # island
  field :waterbody, type: String                        # waterbody
  field :locality, type: String                         # locality
  field :location_remarks, type: String                 # locationRemarks
  field :decimal_longitude, type: String                # decimalLongitude
  field :decimal_latitude, type: String                 # decimalLatitude
  field :coordinate_uncertainty_in_meters, type: String # coordinateUncertaintyInMeters
  field :geodetic_datum, type: String                   # geodeticDatum
  field :georeferenced_date, type: String               # georeferencedDate
  field :event_date, type: Date                         # eventDate
  field :recorded_by, type: String                      # recordedBy
  field :event_remarks, type: String                    # eventRemarks
  field :preparations, type: String                     # preparations
  field :modified, type: DateTime                       # modified
end
