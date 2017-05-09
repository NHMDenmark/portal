Rails.application.routes.draw do
  get 'source_collections/index'

  get 'source_collections/show'

  root 'collection_objects#index'
  get	'/collection_objects/:id', to: 'collection_objects#show'
end
