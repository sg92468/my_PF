Rails.application.routes.draw do

  devise_for :companies
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :portfolios do
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    resources :users, only: [:show, :edit, :update]
    get "users/:id/favorites" => "users#favorites"

  end


end
