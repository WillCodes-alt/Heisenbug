Rails.application.routes.draw do
  #get 'home/index'
  devise_for :users


  resources :projects do
    resources :bugs do
      resources :comments, only: [:create,:destroy]
    end
  end
  get '/dashboard', to: 'dashboard#index', as: :user_root
  get 'toggle', to: 'bug#toggle', as: :toggle
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
