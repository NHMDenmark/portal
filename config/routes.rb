Rails.application.routes.draw do

  resources :source_collections, only: [:index, :show]
  resources :collection_objects, only: [:index, :show] do
    collection do
    	get :autocomplete
    end
  end
#   get 'object/:dwc_catalog_number', to: 'collection_objects#object', as: :object
  get 'object/:id', to: 'collection_objects#show', as: :object

  # iiif
  get 'object/iiif/:id/manifest', to: 'manifests#show'

  # where :name can be +normal+
  get 'object/iiif/:id/sequence/:name', to: 'sequences#show'

  get 'object/iiif/:id/canvas/:name', to: 'canvases#show'
  get 'object/iiif/:id/annotation/:name', to: 'annotations#show'

  # RDF
  get 'data/rdf/:id', to: 'collection_objects#rdf', defaults: { format: 'xml' }

  root 'collection_objects#index'
end
