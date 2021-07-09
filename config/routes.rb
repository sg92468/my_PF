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
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update]

  end


end
