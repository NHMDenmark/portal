class Location
  include Mongoid::Document
  has_many :collection_objects
  field :continent, type: String
  field :country, type: String
  field :state_province, type: String
  field :county, type: String
  field :higher_geography, type: String
  field :island_group, type: String
  field :island, type: String
  field :waterbody, type: String
  field :locality, type: String
  field :named_place, type: String
  field :relation_to_named_place, type: String
  field :location_remarks, type: String
  field :decimal_longitude, type: Float
  field :decimal_latitude, type: Float
  field :coordinate_uncertainty_in_meters, type: String
  field :geodetic_datum, type: String
  field :georeferenced_date, type: String
end
