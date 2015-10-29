Rails.application.routes.draw do

  get '/', to:'welcome#home'

  get '/answers/new', to: 'answers#new'
  # post '/answers', to: 'answers#create'
  get 'answers/:id', to: 'answers#show'

  get '/puzzles/:id', to: 'puzzles#show'
  post '/puzzles/:id/answers', to: 'answers#create', as: "puzzle_answers"
  get '/puzzles/:id/answers', to: 'answers#index'

end
