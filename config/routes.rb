Rails.application.routes.draw do
    devise_for :users
 resources :books,only:[:show,:edit,:index,:create,:destroy,:update]
 resources :users,only:[:index,:show,:edit,:update]
 get "home/about" => "homes#about"
 
  root to:"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
