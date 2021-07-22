Rails.application.routes.draw do

  devise_for :companies, :controllers => {
    :sessions => 'companies/sessions'
  }

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

    resources :users, only: [:show, :edit, :update] do
      resources :follow_companies, only: [:destroy, :show, :index]
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests, only: [:index, :show, :destroy]
    end
    get "users/:id/favorites" => "users#favorites"

  end

  namespace :company do
    resources :companies, only: [:show, :edit, :update]
    resources :users, only: [:index, :show] do
      resource :follow_requests, only: [:create, :destroy]
    end
    resources :portfolios, only: [:index, :show, :search]

  end


end
