Rails.application.routes.draw do
  devise_for :members, controllers: {
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, except: [:new, :show, :index]
      member do
        post 'like'
        delete 'unlike'
      end
  end

  resources :profiles, only: [:show, :edit, :update]

  root to: "posts#index"
end
