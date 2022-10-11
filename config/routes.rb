Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :groups do
    resources :user_transactions
  end
  root "home#index"
  authenticated :user do
    root :to => 'groups#index', as: :authenticated_root
  end

end