class DwcLocation
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_location_id, type: String
  field :dwc_higher_geography_id, type: String
  field :dwc_higher_geography, type: String
  field :dwc_continent, type: String
  field :dwc_water_body, type: String
  field :dwc_island_group, type: String
  field :dwc_island, type: String
  field :dwc_country, type: String
  field :dwc_country_code, type: String
  field :dwc_state_province, type: String
  field :dwc_county, type: String
  field :dwc_municipality, type: String
  field :dwc_locality, type: String
  field :dwc_verbatim_locality, type: String
  field :dwc_minimum_elevation_in_meters, type: Float
  field :dwc_maximum_elevation_in_meters, type: Float
  field :dwc_verbatim_elevation, type: String
  field :dwc_minimum_depth_in_meters, type: Float
  field :dwc_maximum_depth_in_meters, type: Float
  field :dwc_verbatim_depth, type: String
  field :dwc_minimum_distance_above_surface_in_meters, type: Float
  field :dwc_maximum_distance_above_surface_in_meters, type: Float
  field :dwc_location_according_to, type: String
  field :dwc_location_remarks, type: String
  field :dwc_decimal_latitude, type: Float
  field :dwc_decimal_longitude, type: Float
  field :dwc_geodetic_datum, type: String
  field :dwc_coordinate_uncertainty_in_meters, type: Float
  field :dwc_coordinate_precision, type: Float
  field :dwc_point_radius_spatial_fit, type: Float
  field :dwc_verbatim_coordinates, type: String
  field :dwc_verbatim_latitude, type: String
  field :dwc_verbatim_longitude, type: String
  field :dwc_verbatim_coordinate_system, type: String
  field :dwc_verbatim_s_r_s, type: String
  field :dwc_footprint_w_k_t, type: String
  field :dwc_footprint_s_r_s, type: String
  field :dwc_footprint_spatial_fit, type: Float
  field :dwc_georeferenced_by, type: String
  field :dwc_georeferenced_date, type: String
  field :dwc_georeference_protocol, type: String
  field :dwc_georeference_sources, type: String
  field :dwc_georeference_verification_status, type: String
  field :dwc_georeference_remarks, type: String
end
