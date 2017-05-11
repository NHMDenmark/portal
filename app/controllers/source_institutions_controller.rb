class SourceInstitutionsController < ApplicationController
  def index
  end

  def show
    @institution = SourceInstitution.find params[:id]
  end
end
