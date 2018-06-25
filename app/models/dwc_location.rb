# frozen_string_literal: true

# Embedded model for DwC Location.
# http://purl.org/dc/terms/Location
# A spatial region or named place.
class DwcLocation
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/locationID
  # An identifier for the set of location information (data associated with
  # dcterms:Location). May be a global unique identifier or an identifier
  # specific to the data set.
  field :location_id, as: :dwc_location_id, type: String

  # http://rs.tdwg.org/dwc/terms/higherGeographyID
  # An identifier for the geographic region within which the Location occurred.
  # Recommended best practice is to use an persistent identifier from a
  # controlled vocabulary such as the Getty Thesaurus of Geographic Names.
  field :higher_geography_id, as: :dwc_higher_geography_id, type: String

  # http://rs.tdwg.org/dwc/terms/higherGeography
  # A list (concatenated and separated) of geographic names less specific than
  # the information captured in the locality term.
  # TODO: generate default from geography fields (:continent, :country, etc)
  field :higher_geography, as: :dwc_higher_geography, type: String

  # http://rs.tdwg.org/dwc/terms/continent
  # The name of the continent in which the Location occurs. Recommended best
  # practice is to use a controlled vocabulary such as the Getty Thesaurus of
  # Geographic Names.
  field :continent, as: :dwc_continent, type: String

  # http://rs.tdwg.org/dwc/terms/waterBody
  # The name of the water body in which the Location occurs. Recommended best
  # practice is to use a controlled vocabulary such as the Getty Thesaurus of
  # Geographic Names.
  field :water_body, as: :dwc_water_body, type: String

  # http://rs.tdwg.org/dwc/terms/islandGroup
  # The name of the island group in which the Location occurs. Recommended best
  # practice is to use a controlled vocabulary such as the Getty Thesaurus of
  # Geographic Names.
  field :island_group, as: :dwc_island_group, type: String

  # http://rs.tdwg.org/dwc/terms/island
  # The name of the island on or near which the Location occurs. Recommended
  # best practice is to use a controlled vocabulary such as the Getty Thesaurus
  # of Geographic Names.
  field :island, as: :dwc_island, type: String

  # http://rs.tdwg.org/dwc/terms/country
  # The name of the country or major administrative unit in which the Location
  # occurs. Recommended best practice is to use a controlled vocabulary such as
  # the Getty Thesaurus of Geographic Names.
  field :country, as: :dwc_country, type: String

  # CSPP :isoCountry
  # http://rs.tdwg.org/dwc/terms/countryCode
  # The standard code for the country in which the Location occurs. Recommended
  # best practice is to use ISO 3166-1-alpha-2 country codes.
  field :iso_country, as: :dwc_country_code, type: String

  # http://rs.tdwg.org/dwc/terms/stateProvince
  # The name of the next smaller administrative region than country (state,
  # province, canton, department, region, etc.) in which the Location occurs.
  field :state_or_province, as: :dwc_state_province, type: String

  # http://rs.tdwg.org/dwc/terms/county
  # The full, unabbreviated name of the next smaller administrative region than
  # stateProvince (county, shire, department, etc.) in which the Location
  # occurs.
  field :county, as: :dwc_county, type: String

  # http://rs.tdwg.org/dwc/terms/municipality
  # The full, unabbreviated name of the next smaller administrative region than
  # county (city, municipality, etc.) in which the Location occurs. Do not use
  # this term for a nearby named place that does not contain the actual
  # location.
  # TODO: filter if Specify relation to named place is not 'within'
  field :named_place, as: :dwc_municipality, type: String

  # http://rs.tdwg.org/dwc/terms/locality
  # The specific description of the place. This term may contain information
  # modified from the original to correct perceived errors or standardize the
  # description.
  field :locality, as: :dwc_locality, type: String

  # http://rs.tdwg.org/dwc/terms/verbatimLocality
  # The original textual description of the place.
  field :verbatim_locality, as: :dwc_verbatim_locality, type: String

  # http://rs.tdwg.org/dwc/terms/minimumElevationInMeters
  # The lower limit of the range of elevation (altitude, usually above sea
  # level), in meters.
  field :minimum_elevation, as: :dwc_minimum_elevation_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/maximumElevationInMeters
  # The upper limit of the range of elevation (altitude, usually above sea
  # level), in meters.
  field :maximum_elevation, as: :dwc_maximum_elevation_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/verbatimElevation
  # The original description of the elevation (altitude, usually above sea
  # level) of the Location.
  field :verbatim_elevation, as: :dwc_verbatim_elevation, type: String

  # http://rs.tdwg.org/dwc/terms/minimumDepthInMeters
  # The lesser depth of a range of depth below the local surface, in meters.
  field :minimum_depth, as: :dwc_minimum_depth_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/maximumDepthInMeters
  # The greater depth of a range of depth below the local surface, in meters.
  field :maximum_depth, as: :dwc_maximum_depth_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/verbatimDepth
  # The original description of the depth below the local surface.
  field :verbatim_depth, as: :dwc_verbatim_depth, type: String

  # http://rs.tdwg.org/dwc/terms/minimumDistanceAboveSurfaceInMeters
  # The lesser distance in a range of distance from a reference surface in the
  # vertical direction, in meters. Use positive values for locations above the
  # surface, negative values for locations below. If depth measures are given,
  # the reference surface is the location given by the depth, otherwise the
  # reference surface is the location given by the elevation.
  field :minimum_distance_above_surface,
        as: :dwc_minimum_distance_above_surface_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/maximumDistanceAboveSurfaceInMeters
  # The greater distance in a range of distance from a reference surface in the
  # vertical direction, in meters. Use positive values for locations above the
  # surface, negative values for locations below. If depth measures are given,
  # the reference surface is the location given by the depth, otherwise the
  # reference surface is the location given by the elevation.
  field :maximum_distance_above_surface,
        as: :dwc_maximum_distance_above_surface_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/locationAccordingTo
  # Information about the source of this Location information. Could be a
  # publication (gazetteer), institution, or team of individuals.
  field :location_according_to, as: :dwc_location_according_to, type: String

  # http://rs.tdwg.org/dwc/terms/locationRemarks
  # Comments or notes about the Location.
  field :remarks, as: :dwc_location_remarks, type: String

  # CSPP :latitude
  # http://rs.tdwg.org/dwc/terms/decimalLatitude
  # The geographic latitude (in decimal degrees, using the spatial reference
  # system given in geodeticDatum) of the geographic center of a Location.
  # Positive values are north of the Equator, negative values are south of it.
  # Legal values lie between -90 and 90, inclusive.
  field :latitude, as: :dwc_decimal_latitude, type: Float

  # CSPP :longitude
  # http://rs.tdwg.org/dwc/terms/decimalLongitude
  # The geographic longitude (in decimal degrees, using the spatial reference
  # system given in geodeticDatum) of the geographic center of a Location.
  # Positive values are east of the Greenwich Meridian, negative values are west
  # of it. Legal values lie between -180 and 180, inclusive.
  field :longitude, as: :dwc_decimal_longitude, type: Float

  # http://rs.tdwg.org/dwc/terms/geodeticDatum
  # The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which
  # the geographic coordinates given in decimalLatitude and decimalLongitude as
  # based. Recommended best practice is use the EPSG code as a controlled
  # vocabulary to provide an SRS, if known. Otherwise use a controlled
  # vocabulary for the name or code of the geodetic datum, if known. Otherwise
  # use a controlled vocabulary for the name or code of the ellipsoid, if known.
  # If none of these is known, use the value "unknown".
  field :datum, as: :dwc_geodetic_datum, type: String

  # http://rs.tdwg.org/dwc/terms/coordinateUncertaintyInMeters
  # The horizontal distance (in meters) from the given decimalLatitude and
  # decimalLongitude describing the smallest circle containing the whole of the
  # Location. Leave the value empty if the uncertainty is unknown, cannot be
  # estimated, or is not applicable (because there are no coordinates). Zero is
  # not a valid value for this term.
  field :uncertainty, as: :dwc_coordinate_uncertainty_in_meters, type: Float

  # http://rs.tdwg.org/dwc/terms/coordinatePrecision
  # A decimal representation of the precision of the coordinates given in the
  # decimalLatitude and decimalLongitude.
  field :precision, as: :dwc_coordinate_precision, type: Float

  # http://rs.tdwg.org/dwc/terms/pointRadiusSpatialFit
  # The ratio of the area of the point-radius (decimalLatitude,
  # decimalLongitude, coordinateUncertaintyInMeters) to the area of the true
  # (original, or most specific) spatial representation of the Location. Legal
  # values are 0, greater than or equal to 1, or undefined. A value of 1 is an
  # exact match or 100% overlap. A value of 0 should be used if the given
  # point-radius does not completely contain the original representation.
  # The pointRadiusSpatialFit is undefined (and should be left blank) if the
  # original representation is a point without uncertainty and the given
  # georeference is not that same point (without uncertainty). If both the
  # original and the given georeference are the same point, the
  # pointRadiusSpatialFit is 1.
  field :point_radius_spatial_fit, as: :dwc_point_radius_spatial_fit,
                                   type: Float

  # http://rs.tdwg.org/dwc/terms/verbatimCoordinates
  # The verbatim original spatial coordinates of the Location. The coordinate
  # ellipsoid, geodeticDatum, or full Spatial Reference System (SRS) for these
  # coordinates should be stored in verbatimSRS and the coordinate system should
  # be stored in verbatimCoordinateSystem.
  field :verbatim_coordinates, as: :dwc_verbatim_coordinates, type: String

  # http://rs.tdwg.org/dwc/terms/verbatimLatitude
  # The verbatim original latitude of the Location. The coordinate ellipsoid,
  # geodeticDatum, or full Spatial Reference System (SRS) for these coordinates
  # should be stored in verbatimSRS and the coordinate system should be stored
  # in verbatimCoordinateSystem.
  field :verbatim_latitude, as: :dwc_verbatim_latitude, type: String

  # http://rs.tdwg.org/dwc/terms/verbatimLongitude
  # The verbatim original longitude of the Location. The coordinate ellipsoid,
  # geodeticDatum, or full Spatial Reference System (SRS) for these coordinates
  # should be stored in verbatimSRS and the coordinate system should be stored
  # in verbatimCoordinateSystem.
  field :verbatim_longitude, as: :dwc_verbatim_longitude, type: String

  # http://rs.tdwg.org/dwc/terms/verbatimCoordinateSystem
  # The spatial coordinate system for the verbatimLatitude and verbatimLongitude
  # or the verbatimCoordinates of the Location.
  field :verbatim_coordinate_system, as: :dwc_verbatim_coordinate_system,
                                     type: String

  # http://rs.tdwg.org/dwc/terms/verbatimSRS
  # The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which
  # coordinates given in verbatimLatitude and verbatimLongitude, or
  # verbatimCoordinates are based. Recommended best practice is use the EPSG
  # code as a controlled vocabulary to provide an SRS, if known. Otherwise use a
  # controlled vocabulary for the name or code of the geodetic datum, if known.
  # Otherwise use a controlled vocabulary for the name or code of the ellipsoid,
  # if known. If none of these is known, use the value "unknown".
  field :verbatim_s_r_s, as: :dwc_verbatim_s_r_s, type: String

  # http://rs.tdwg.org/dwc/terms/footprintWKT
  # A Well-Known Text (WKT) representation of the shape (footprint, geometry)
  # that defines the Location. A Location may have both a point-radius
  # representation (see decimalLatitude) and a footprint representation, and
  # they may differ from each other.
  field :footprint_w_k_t, as: :dwc_footprint_w_k_t, type: String

  # http://rs.tdwg.org/dwc/terms/footprintSRS
  # A Well-Known Text (WKT) representation of the Spatial Reference System (SRS)
  # for the footprintWKT of the Location. Do not use this term to describe the
  # SRS of the decimalLatitude and decimalLongitude, even if it is the same as
  # for the footprintWKT - use the geodeticDatum instead.
  field :footprint_s_r_s, as: :dwc_footprint_s_r_s, type: String

  # http://rs.tdwg.org/dwc/terms/footprintSpatialFit
  # The ratio of the area of the footprint (footprintWKT) to the area of the
  # true (original, or most specific) spatial representation of the Location.
  # Legal values are 0, greater than or equal to 1, or undefined. A value of 1
  # is an exact match or 100% overlap. A value of 0 should be used if the given
  # footprint does not completely contain the original representation. The
  # footprintSpatialFit is undefined (and should be left blank) if the original
  # representation is a point and the given georeference is not that same point.
  # If both the original and the given georeference are the same point, the
  # footprintSpatialFit is 1.
  field :footprint_spatial_fit, as: :dwc_footprint_spatial_fit, type: Float

  # http://rs.tdwg.org/dwc/terms/georeferencedBy
  # A list (concatenated and separated) of names of people, groups, or
  # organizations who determined the georeference (spatial representation) for
  # the Location.
  field :georeferenced_by, as: :dwc_georeferenced_by, type: String

  # http://rs.tdwg.org/dwc/terms/georeferencedDate
  # The date on which the Location was georeferenced. Recommended best practice
  # is to use an encoding scheme, such as ISO 8601:2004(E).
  field :georeferenced_date, as: :dwc_georeferenced_date, type: String

  # http://rs.tdwg.org/dwc/terms/georeferenceProtocol
  # A description or reference to the methods used to determine the spatial
  # footprint, coordinates, and uncertainties.
  field :georeference_protocol, as: :dwc_georeference_protocol, type: String

  # http://rs.tdwg.org/dwc/terms/georeferenceSources
  # A list (concatenated and separated) of maps, gazetteers, or other resources
  # used to georeference the Location, described specifically enough to allow
  # anyone in the future to use the same resources.
  field :georeference_sources, as: :dwc_georeference_sources, type: String

  # http://rs.tdwg.org/dwc/terms/georeferenceVerificationStatus
  # A categorical description of the extent to which the georeference has been
  # verified to represent the best possible spatial description.
  field :georeference_verification_status,
        as: :dwc_georeference_verification_status, type: String

  # http://rs.tdwg.org/dwc/terms/georeferenceRemarks
  # Notes or comments about the spatial description determination, explaining
  # assumptions made in addition or opposition to the those formalized in the
  # method referred to in georeferenceProtocol.
  field :georeference_remarks, as: :dwc_georeference_remarks, type: String
end
