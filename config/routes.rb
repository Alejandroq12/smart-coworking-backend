Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }

  namespace :api do
    namespace :v1 do
      # User-related routes
      resources :users, only: [:index] do
        resources :workspaces, only: [:index, :create, :destroy]
      end



      # States routes
      resources :states, only: [:index]

      # Cities: No separate "all_cities" route.
      resources :cities, only: [:index, :show]

      # Workspaces: Standard RESTful routes
      resources :workspaces, only: [:index, :show, :create, :destroy]
      resources :reservations, only: [:index, :show, :create, :destroy]
    end
  end

  # Catch-all route for frontend client-side routing
  get '*path', to: redirect('/')
end
