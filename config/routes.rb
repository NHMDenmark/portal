Rails.application.routes.draw do
  get 'localities/index'
  get 'localities/show'
  resources :localities, only: [:index, :show]
  get 'taxon_names/index'
  get 'taxon_names/show'
  resources :taxon_names, only: [:index, :show]
  get 'source_institutions/index'
  get 'source_institutions/show'
  resources :source_institutions, only: [:index, :show]
  get 'source_collections/index'
  get 'source_collections/show'
  resources :source_collections#, only: [:index, :show]
  resources :collection_objects, only: [:index, :show]

  root 'collection_objects#index'
end
