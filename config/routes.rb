Rails.application.routes.draw do
  devise_for :members, controllers: {
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, except: [:new, :show, :index]
  end

  resources :profiles, only: [:show, :create, :edit]

  root to: "posts#index"
end
