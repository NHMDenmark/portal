class TaxaController < ApplicationController
  def index
  end

  def show
    @taxon = Taxon.find(params[:id])
  end
end
