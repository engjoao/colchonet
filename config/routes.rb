Colchonet::Application.routes.draw do
  resources :rooms
  resources :users

  resource :confirmation, :only => [:show]
  root :to => "home#index"
end
