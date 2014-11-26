Rails.application.routes.draw do
  resources :categories

  resources :products
  
  get 'store/:id' => 'store#show', as: 'store_show'
  # For the associated action the id will be in params[:id]
  
  get 'search_results' => 'store#search_results', as: 'search_results'
  
  root to: 'store#index'
end
