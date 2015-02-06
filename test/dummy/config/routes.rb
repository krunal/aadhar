Rails.application.routes.draw do

  resources :high_scores

  mount Aadhar::Engine => "/aadhar"
end
