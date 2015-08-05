Rails.application.routes.draw do
  resources :articles, except: [:new, :edit] do
    resources :comments, only: [:index, :create]
  end
  resources :comments, except: [:new, :edit, :index, :create]
end
