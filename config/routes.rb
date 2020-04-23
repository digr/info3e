Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/logout'

  post 'assessments/create'

  get 'welcome/index'
  get 'welcome/calendar'
  get 'welcome/admin'

  resources :users, only: [:new, :create, :index]
  resources :cources
  resources :tasks, only: [:new, :create, :index, :destroy]
  resources :solutions, only: [:new, :create, :index]

  root 'welcome#index'
end
