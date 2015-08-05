Rails.application.routes.draw do
  resources :articles, except: [:new, :edit]
  resources :comments, except: [:new, :edit]
end
