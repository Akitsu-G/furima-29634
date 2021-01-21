Rails.application.routes.draw do

  # /
  root to: "items#index"

  # item
  resources :items do
    # order
    resources :orders
  end

  # address
  resources :addresses

  # devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',#登録
    sessions: 'users/sessions'#ログイン
  }
end
