Rails.application.routes.draw do
  # get '/recipes/:recipe_id/comments' => 'comments#index'

  get '/recipes/:recipe_id/comments/new' => 'comments#new'
  post '/recipes/:recipe_id/comments' => 'comments#create'

  get '/comments/:id/edit' => 'comments#edit'
  patch '/comments/:id' => 'comments#update'

  get '/comments/:id' => 'comments#show'

  delete '/comments/:id' => 'comments#destroy'

  resources :recipes do
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:show, :edit, :update, :destory]

  resources :welcome, only: [:index]
  post '/retrieve_recipes' => 'recipes#retrieve_recipes'
  root 'welcome#index'
  post '/random_recipe' => 'recipes#random_recipe'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # resources 'users'
  devise_scope :user do
    get '/register' => 'devise/registrations#new'
    post '/register' => 'devise/registrations#create'

    get '/login' => 'devise/sessions#new'
    post '/login' => 'devise/sessions#create'
    delete "/logout" => "devise/sessions#destroy"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
