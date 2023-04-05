Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'articles#index'
  get '/mypage', to: 'mypage#show'
  resources :articles
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # ルーティングの設定
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
