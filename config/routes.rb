Rails.application.routes.draw do

  resources :locations, only: [:index, :show]
  resources :taxa, only: [:index, :show]
  resources :source_collections, only: [:index, :show]
  resources :collection_objects, only: [:index, :show] do
  	get :autocomplete
  end

  root 'collection_objects#index'
end
