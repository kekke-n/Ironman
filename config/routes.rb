Rails.application.routes.draw do
  resources :categories
  resources :queries do
    member do
      post :download_csv
      post :download_tsv
    end
  end
  get 'home/index'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
