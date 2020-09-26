Rails.application.routes.draw do
  root to: "items#index"
  # deviseのコントローラ参照設定
  devise_for :users, controllers: {
    registrations: 'users/registrations',#登録
    sessions: 'users/sessions'#ログイン
  }
end
