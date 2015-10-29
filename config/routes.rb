Rails.application.routes.draw do

  get '/', to:'welcome#home'

  get "/sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get '/sign_out', to: 'sessions#destroy'


  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"

  get '/answers/new', to: 'answers#new'
  # post '/answers', to: 'answers#create'
  get 'answers/:id', to: 'answers#show'

  get '/puzzles/:id', to: 'puzzles#show'
  post '/puzzles/:id/answers', to: 'answers#create', as: "puzzle_answers"
  get '/puzzles/:id/answers', to: 'answers#index'

end
