Rails.application.routes.draw do
  root 'collection_objects#index'
  get	'/collection_objects/:id', to: 'collection_objects#show'
end
