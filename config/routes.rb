Rails.application.routes.draw do
  root "root#index"

  get "/dashboard", to: "dashboard/root#index"

  namespace :dashboard do
    get :login, to: 'sessions#new'
    post :login, to: 'sessions#create'
    delete :logout, to: 'sessions#destroy'
  end
end
