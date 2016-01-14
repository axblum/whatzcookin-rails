Rails.application.routes.draw do

  resources :recipes do
    resources :comments
    resources :ratings
  end

  resources :welcome, only: [:index]
  resources :restrictions, only: [:create]

  post '/create_taste_profile' => 'users#calculate_profile'

  post '/suggestions' => 'recipes#suggestions'
  post '/retrieve_recipes' => 'recipes#retrieve_recipes'
  root 'welcome#index'
  get '/random_recipe' => 'recipes#random_recipe'

  # Nested nutritional profile under Devise scope
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }

  devise_scope :user do
    resources :users do
      resources :nutritional_profiles
      resources :favorites , only: [:index, :create, :destroy]
    end
    get '/register' => 'devise/registrations#new'
    post '/register' => 'devise/registrations#create'

    get '/login' => 'devise/sessions#new'
    post '/login' => 'devise/sessions#create'
    delete "/logout" => "devise/sessions#destroy"
  end
end
