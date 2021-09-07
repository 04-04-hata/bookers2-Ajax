Rails.application.routes.draw do

 root to: 'homes#top'

  get 'home/about', to: 'homes#about'

  devise_for :users

  resources :users,only:[:index,:show,:update,:edit] do

   resource :relationships,only:[:create,:destroy]

   get 'followings' => 'relationships#followings', as: 'followings'

   get 'followers' => 'relationships#followers', as: 'followers'

  end

  resources :books,only:[:index,:show,:edit,:create,:update,:destroy] do

   resources :book_comments,only:[:create,:destroy]

   resource :favorites,only:[:create,:destroy]

  end

end
