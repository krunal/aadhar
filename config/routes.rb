Aadhar::Engine.routes.draw do
  resources :users
  resources :sessions
  post 'passwords', :to => "passwords#update"
  post 'passwords/reset', :to => "passwords#reset"
  
end
