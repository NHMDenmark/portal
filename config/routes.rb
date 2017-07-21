Rails.application.routes.draw do

  resources :taxa, only: [:index, :show]
  resources :source_collections, only: [:index, :show]
  resources :collection_objects, only: [:index, :show] do
    collection do
    	get :autocomplete
    end
  end
  get 'object/:dwc_catalog_number', to: 'collection_objects#object'
  get 'data/rdf/:dwc_catalog_number', to: 'collection_objects#rdf', defaults: { format: 'xml' }
  root 'collection_objects#index'
end
