Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'explore', to: 'pages#explore'
  resources :posts
end
