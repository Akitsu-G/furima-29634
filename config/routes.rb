Rails.application.routes.draw do

  # /
  root to: "items#index"

  # item
  resources :items

  # devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',#登録
    sessions: 'users/sessions'#ログイン
  }
end
