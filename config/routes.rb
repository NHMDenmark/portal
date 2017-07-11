Rails.application.routes.draw do

  resources :taxa, only: [:index, :show]
  resources :source_collections, only: [:index, :show]
  resources :collection_objects, only: [:index, :show] do
    collection do
    	get :autocomplete
    end
  end
  root 'collection_objects#index'
end
