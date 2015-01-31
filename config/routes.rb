Aadhar::Engine.routes.draw do
  resources :users, :only => [:create]
  resources :sessions, :only => [:create, :destroy]
  post 'passwords', :to => "passwords#update"
  post 'passwords/reset', :to => "passwords#reset"
  
end
