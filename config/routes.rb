# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'foods#index'

  resources :foods, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :shoppings, only: [:index, :new, :create, :edit, :update, :destroy] do

    resource :check
  end
end
