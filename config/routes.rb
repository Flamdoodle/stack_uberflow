StackUberflow::Application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    member do
      post :upvote
      post :downvote
    end

    resources :answers, :except => [:index, :show] do
      member do
        post :upvote
        post :downvote
        get :makebest
      end
    end
  end

  resources :users, :only => [:create, :new] do
    resources :comments, :only => [:index]
  end

  resources :comments, :only => [:create]


  post '/users/login', to: 'users#login'
  get '/users/end', to: 'users#end'
end
