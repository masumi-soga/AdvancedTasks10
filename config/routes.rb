Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    :sessions       => "users/sessions",
    :registrations  => "users/registrations",
    :passwords      => "users/passwords"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  post "follow/:id" => "relationships#create", as: "follow"
  post "unfollow/:id" => "relationships#destroy", as: "unfollow"
  get "follow_list/:id" => "relationships#follow_list", as: "follow_list"
  get "follower_list_/:id" => "relationships#follower_list", as: "follower_list"
  get "search" => "searches#search"
end
