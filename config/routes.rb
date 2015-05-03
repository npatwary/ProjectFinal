Rails.application.routes.draw do


  get '/classes' => 'player_character_classes#index', as:'classes'
  post '/classes' => 'player_character_classes#index'
  get '/class/show' => 'player_character_classes#show', as: 'class'
  post '/class/:id' => 'player_character_classes#show'


  post '/races/:id' => 'races#show', as:'race_lookup'

  get '/equipments/:player_character_id/index' => 'equipments#index', as:'equipments_buy'
  get '/equipments/:player_character_id/sell_index' => 'equipments#sell_index', as: 'equipments_sell'
 
 post '/equipments' => 'equipments#create'
 delete '/equipments' => 'equipments#destroy' 


  get '/attack_weapons/:player_character_id/index' => 'attack_weapons#index', as: 'attack_weapons_buy'

  get '/attack_weapons/:player_character_id/sell_index' => 'attack_weapons#sell_index', as: 'attack_weapons_sell'
  post '/attack_weapons' => 'attack_weapons#create'
  delete '/attack_weapons' => 'attack_weapons#destroy' #selling attack_weapon



  get '/armor_and_shields/:player_character_id/index' => 'armor_and_shields#index', as:'armor_and_shields_buy'
  get '/armor_and_shields/:player_character_id/sell_index' => 'armor_and_shields#sell_index', as:'armor_and_shields_sell'
  post '/armor_and_shields' => 'armor_and_shields#create'
  delete '/armor_and_shields' => 'armor_and_shields#destroy' #selling action

  #get 'sessions/new'

  get 'join_game/new'

  get 'join_game/join_game_form'


  resources :player_characters
  get '/player_characters/:id/otheruser' => 'player_characters#showOthers', as: 'otheruser'
  get '/player_characters/:id/market' => 'player_characters#market', as: 'player_character_market'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#new'
  get 'users', to:'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_users'

  post '/users', to: 'users#create'

  #get '/sessions/new', to: 'sessions#new', as: 'sessions_new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/users/:id' => 'users#show', as: 'user'
  
  delete '/users/:id' => 'users#delete'


  get '/games' => 'games#index', as: 'games'
  get '/games/new' => 'games#new', as:'new_game'
  
  get '/games/:id' => 'games#show', as:'game'

  get '/games/:id/edit' => 'games#edit', as:'edit_game'
  patch '/games/:id', to: 'games#update'
  put '/games/:id', to: 'games#update'
  
  delete '/games/:id', to: 'games#leaveGame'



  post '/games' => 'games#create'

  delete '/games' => 'games#destroy'

  get '/game_invitations' => 'game_invitations#index', as:'game_invitations'
  put '/game_invitations' => 'game_invitations#index'
  get '/game_invitations/:game_id/new' => 'game_invitations#new', as:'new_game_invitation'
  post '/game_invitations' => 'game_invitations#create'
  
  delete 'game_invitations' => 'game_invitations#destroy'

  

  get '/join_game/:game_id/new' => 'join_game#new', as:'join_game'
  post '/join_game/:game_id/new' => 'join_game#user_input'
    

  

  delete '/game_invitations' =>'join_game#user_input'

  



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

