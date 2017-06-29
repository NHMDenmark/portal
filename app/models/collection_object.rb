class CollectionObject
  include Mongoid::Document
  belongs_to :source_collection
  belongs_to :taxon
  belongs_to :location
  field :mapping_id, type: Integer                      # mappingId
  field :dataset_name, type: String                     # datasetName
  field :access_rights, type: String                    # accessRights
  field :license, type: String                          # license
  field :basis_of_record, type: String                  # basisOfRecord
  field :catalog_number, type: String                   # catalogNumber
  field :other_catalog_numbers, type: String            # otherCatalogNumbers
  field :field_number, type: String                     # fieldNumber
  field :type_status, type: String                      # typeStatus
  field :event_date, type: Date                         # eventDate
  field :recorded_by, type: String                      # recordedBy
  field :event_remarks, type: String                    # eventRemarks
  field :preparations, type: String                     # preparations
  field :modified, type: DateTime                       # modified
end
