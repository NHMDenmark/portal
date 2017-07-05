class RecordMetadata
  include Mongoid::Document

  embedded_in :collection_object

  field :mapping_id, type: Integer
  field :type, type: String
  field :modified, type: DateTime
  field :language, type: String
  field :license, type: String
  field :rights_holder, type: String
  field :access_rights, type: String
  field :bibliographic_citation, type: String
  field :references, type: String
  field :owner_institution_code, type: String
  field :dataset_id, type: String
  field :dataset_name, type: String
  field :basis_of_record, type: String
  field :information_withheld, type: String
  field :data_generalizations, type: String
end
