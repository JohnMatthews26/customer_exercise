Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :categories, only: [:create, :destroy, :show, :index]
    resources :customers, only: [:create, :destroy, :show, :index]
    resources :products, only: [:create, :destroy, :show, :index]
    resources :order, only: [:create, :destroy, :show, :index]
  end
end
