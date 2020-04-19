Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/logout'

  get 'welcome/index'
  get 'welcome/calendar'

  resources :users, only: [:new, :create, :index]
  resources :cources

  root 'welcome#index'
end
