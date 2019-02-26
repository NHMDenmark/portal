class SequencesController < ApplicationController

  def show
    sq = IIIF::Sequence.new(CollectionObject.find(params[:id]),
                            request.original_url)
    hsh = { id: params[:id], name: params[:name] }
    render json: sq.properties.compact
  end
end
