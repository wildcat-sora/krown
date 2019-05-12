Rails.application.routes.draw do

  root 'krowns#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :krowns do
    collection do
      get 'search'
    end
  end

  resources :genres

end
