Rails.application.routes.draw do

  post "fileuploads/create"
  get 'posts/new'

  get 'posts/create'

  get 'reviews/new'

  get "fileuploads/new"

  resources :posts
  resources :fileuploads, only: [:index,:create,:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
