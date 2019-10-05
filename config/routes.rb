Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :bookings, only: %i(index show new create edit update destroy)
    resources :services, only: %i(index show new create edit update destroy)
    resources :service_items, only: %i(index show new create edit update destroy)
    resources :users, only: %i(index show new create edit update destroy)
    root to: 'bookings#index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  match 'ping' => 'application#ping', via: :all
  match 'auth_ping' => 'application#auth_ping', via: :all

  namespace :api do
    namespace :v1 do
      resources :services
    end
  end
end
