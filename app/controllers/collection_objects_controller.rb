class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.all[0...20] # bogus paging
  end

  def show
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
    @taxonomy = {
      'Order' => @collection_object.taxon_name[:order],
      'Family' => @collection_object.taxon_name[:family],
      'Genus' => @collection_object.taxon_name[:genus],
      'Specific epithet' => @collection_object.taxon_name[:specific_epithet],
      'Infraspecific epithet' => @collection_object.taxon_name[:infraspecific_epithet]
    }.delete_if { |_k, v| v.nil? }
    @geography = {
      'Continent' => @collection_object.locality[:continent],
      'Country' => @collection_object.locality[:country],
      'State/Province' => @collection_object.locality[:state_province],
      'County' => @collection_object.locality[:county]
    }.delete_if { |_k, v| v.nil? }
    @geo_features = {
      'Island Group' => @collection_object.locality[:island_group],
      'Island' => @collection_object.locality[:island],
      'Waterbody' => @collection_object.locality[:waterbody],
      'Named Place' => @collection_object.locality[:named_place],
      'Relation' => @collection_object.locality[:relation_to_named_place]
    }.delete_if { |_k, v| v.nil? }
    @georef = {
      'Longitude' => @collection_object.locality[:decimal_longitude],
      'Latitude' => @collection_object.locality[:decimal_latitude],
      'Uncertainty (m)' => @collection_object.locality[:coordinate_uncertainty_in_meters],
      'Datum' => @collection_object.locality[:geodetic_datum],
      'Date georeferenced' => @collection_object.locality[:georeferenced_date]
    }.delete_if { |_k, v| v.nil? }
  end
end
