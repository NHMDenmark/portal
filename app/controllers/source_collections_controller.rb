class SourceCollectionsController < ApplicationController
  def index
    @collections = SourceCollection.all
  end

  def show
    @collection = SourceCollection.find params[:id]
  end

  def breadcrumbs
    case action_name
    when 'show'
      [[@collection[:dwc_collection_id], @collection]]
    when 'index'
      [['Collections', '#']]
    else
      ["define #{controller_name}#{action_name} breadcrumbs", '#']
    end
  end
end
