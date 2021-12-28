# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'foods#index'

  resources :foods, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
    
    resource :select, only: [:create, :destroy, :new]
  end
  
  resources :shoppings, only: [:index, :new, :create, :destroy] do
    resource :check, only: [:create, :destroy]
  end

  resource :profile, only: [:show, :edit, :update] do
    collection do
      get 'search'
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create, :destroy]
  end
end
