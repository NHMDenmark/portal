Rails.application.routes.draw do
  get 'source_collections/index'
  get	'/source_collections/:id', to: 'source_collections#show'
 # get 'source_collections/show'

  get	'/collection_objects/:id', to: 'collection_objects#show'

  root 'collection_objects#index'
end
