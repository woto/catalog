Rails.application.routes.draw do

  constraints domain: 'farm.ru' do
    scope module: 'farm', as: 'farm' do
      get 'about', to: 'about#show'
      resource :order, only: [:create]
      resource :cart, only: [:show, :update, :create]
      get 'search(/page/:page)', to: 'search#index', as: 'search'
      resources :products, only: [:show]
      root 'welcome#index'
    end
  end

  resources :trees
  resources :products
  root 'products#index'
end
