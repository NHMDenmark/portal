Rails.application.routes.draw do

  resources :locations, only: [:index, :show]
  resources :taxon_names, only: [:index, :show]
  resources :source_collections, only: [:index, :show]
  resources :collection_objects, only: [:index, :show]

  root 'collection_objects#index'
end
