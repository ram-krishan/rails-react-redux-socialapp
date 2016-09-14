Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#home"
  get '/public/feeds' => 'posts#feeds'
  resources :posts do
    member do
      post 'post_like_unlike'
    end
  end

  resources :comments, only: [:create]
end
