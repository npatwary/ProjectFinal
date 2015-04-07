Rails.application.routes.draw do
  resources :player_characters

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#new'
  get 'users', to:'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_users'

  post '/users', to: 'users#create'

  get '/users/:id' => 'users#show', as: 'user'

  get '/games' => 'games#index', as: 'games'
  get '/games/new' => 'games#new', as:'new_game'
  get '/games/:id' => 'games#show', as:'game'
  get '/games/:id/edit' => 'games#edit', as:'edit_game'
  post '/games' => 'games#create'

  get '/game_invitations' => 'game_invitations#index', as:'game_invitations'
  get '/game_invitations/:game_id/new' => 'game_invitations#new', as:'new_game_invitation'
  post '/game_invitations' => 'game_invitations#create'
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
