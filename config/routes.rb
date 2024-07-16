Rails.application.routes.draw do
    devise_for :users
 resources :books,only:[:new,:show,:edit,:index,:create,:destroy]
 resources :users,only:[:index,:show,:edit,:update]
 get "/about" => "homes#about"
 
  root to:"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
