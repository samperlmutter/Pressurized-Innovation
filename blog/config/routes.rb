Rails.application.routes.draw do
  get 'like/new'
  get 'like/create'
  get 'like/delete'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'welcome/index'
  
  resources :articles do
    resources :comments
    get 'like', on: :member
  end
  
  ####################################
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  ########################################
  
  get 'users/forgotCred'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
