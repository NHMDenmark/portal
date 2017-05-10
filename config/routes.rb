Rails.application.routes.draw do
  get 'source_collections/index'
  get 'source_collections/show'
  resources :source_collections#, only: [:index, :show]
  resources :collection_objects, only: [:index, :show]

  root 'collection_objects#index'
end
