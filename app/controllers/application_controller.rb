class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def all_collections
    SourceCollection.all.to_a
  end

  def breadcrumbs
    [["implement #{controller_name}#breadcrumbs", '#']] # this wants integration testing
  end

  helper_method :all_collections
  helper_method :breadcrumbs
end
