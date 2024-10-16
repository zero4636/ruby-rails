require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    constraints lambda { |request| !request.env['warden'].user } do
      match '*path', to: redirect('/admin'), via: :all
    end
    root to: 'dashboard#index'
    resources :users
    authenticated :user do
      get '/', to: 'dashboard#index', as: :dashboard
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
