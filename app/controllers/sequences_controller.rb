class SequencesController < ApplicationController
  def show
    sq = IIIF::Sequence.new(CollectionObject.find(params[:id]),
                            request.original_url)
    render json: sq.properties.compact
  end
end
