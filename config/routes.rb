Colchonet::Application.routes.draw do
	resources :rooms do
      resources :reviews, :only => [:create, :update], :module => :rooms
    end
    resources :users

    resource :confirmation, :only => [:show]
    resource :user_sessions, :only => [:create, :new, :destroy]
  
  root :to => "home#index"
end
