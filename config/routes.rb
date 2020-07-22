Rails.application.routes.draw do

  root 'krowns#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :krowns do
    collection do
      get 'search'
      get 'wordsearch'
    end
  end

  #form_forに対応して、指定のアクションのみ定義する
  post 'krowns/:id' => 'krowns#create'
  get 'portfolio' => 'krowns#portfolio'

  #テスト用表示ビュー
  get 'testpage' => 'krowns#testpage'

  resources :genres

end
