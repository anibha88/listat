Rails.application.routes.draw do
  get 'trash/index'
  get 'trash/restore'
  get 'trash/:type/index' => "trash#index"
  get 'trash/:type/restore'  => "trash#restore"
  
  root to: "lists#index"
  resources :lists do 
  	resources :list_items
  end
end
