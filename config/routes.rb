Rails.application.routes.draw do
  devise_for :users

  resources :groups do
    resources :user_transactions
  end
  root "groups#index"

end