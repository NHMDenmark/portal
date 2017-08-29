class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def all_collections
    SourceCollection.all.to_a
  end

  helper_method :all_collections
end
