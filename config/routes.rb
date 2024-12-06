Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }

  # Defines the root path route ("/")
  # root "posts#index"

  # Namespaced API routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :space_cws, only: [:index, :create, :destroy]
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :states, only: [:index] do
        # resources :reservations, only: [:index, :create, :destroy]
        resources :cities, only: [:index] do
          resources :reservations, only: [:index, :create, :destroy]
        end
      end

      resources :cities, only: [:show]
      get 'all_cities', to: 'cities#all_cities'
      get 'coworking_spaces', to: 'space_cws#index'
      resources :space_cws, only: [:show]
    end
  end
  get '*path', to: redirect('/')
end
