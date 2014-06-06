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
      end
    end
  end
end
