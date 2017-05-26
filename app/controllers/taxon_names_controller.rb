class TaxonNamesController < ApplicationController
  def index
  end

  def show
    @taxon = TaxonName.find(params[:id])
  end
end
