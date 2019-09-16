Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do 
  	resources :list_items
  end
end
