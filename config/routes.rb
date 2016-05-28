Rails.application.routes.draw do

  resources :trees
  #concern :paginatable do
  #  get '(page/:page)', :action => :index, :on => :collection, :as => ''
  #end

  constraints domain: 'farm.ru' do
    scope module: 'farm', as: 'farm' do
      get 'search(/page/:page)', to: 'search#index', as: 'search'
      resources :products, only: [:show]
      root 'welcome#index'
    end
  end

  resources :indices
  resources :properties
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
