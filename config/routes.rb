Rails.application.routes.draw do

 root to: 'homes#top'

  get 'home/about', to: 'homes#about'

  devise_for :users

  resources :users,only:[:index,:show,:update,:edit]
  resources :books,only:[:index,:show,:edit,:create,:update,:destroy]

end
