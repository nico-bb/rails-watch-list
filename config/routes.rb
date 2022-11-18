Rails.application.routes.draw do
  root "lists#index"

  resources :lists, except: :delete do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, except: [:new, :create, :show, :index, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
