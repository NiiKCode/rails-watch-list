Rails.application.routes.draw do
  get 'bookmarks/new'
  # get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/lists', to: 'lists#index'
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
end
