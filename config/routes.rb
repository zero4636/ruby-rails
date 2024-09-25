Rails.application.routes.draw do
  devise_for :users

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  # Tạo namespace cho admin
  namespace :admin do
    # Redirect về trang login nếu người dùng chưa đăng nhập
    constraints lambda { |request| !request.env['warden'].user } do
      match '*path', to: redirect('/signin'), via: :all
    end
    root to: 'dashboard#index'
    authenticated :user do
      get '/', to: 'dashboard#index', as: :dashboard
    end
  end
end
