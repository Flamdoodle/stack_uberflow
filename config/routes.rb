StackUberflow::Application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    member do
      post :upvote
      post :downvote
      post :makebest
    end

    resources :answers, :except => [:index, :show] do
      member do
        post :upvote
        post :downvote
      end
    end
  end

  resources :users, :only => [:create, :new] do
    resources :comments, :only => [:index]
  end


  post '/users/login', to: 'users#login'
  get '/users/end', to: 'users#end'

  # get "sessions#new"
  # post "sessions#create"
  # get "sessions#delete"

  # resources :sessions, :only => [:new, :create]
  # get "/sessions/new", to: "sessions#new"
  # post "/sessions/create", to: "sessions#create"
  # get "/sessions/end", to: "sessions#end"
end
