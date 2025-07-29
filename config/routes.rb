# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users


  resources :projects do
    resources :bugs do
      resources :comments, only: %i[create destroy]
    end
  end
  get '/dashboard', to: 'dashboard#index', as: :user_root
  post '/projects/:project_id/bugs/:id', to: 'bugs#pick', as: :pick
  post '/projects/:project_id/bugs/:id/drop', to: 'bugs#drop', as: :drop
  post '/projects/:project_id/bugs/:id/status', to: 'bugs#status', as: :status
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
