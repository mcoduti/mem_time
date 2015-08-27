Rails.application.routes.draw do
  # Routes for the Attempt resource:
  # CREATE
  # get "/attempts/new", :controller => "attempts", :action => "new"
  # post "/create_attempt", :controller => "attempts", :action => "create"

  # READ
  get "/attempts", :controller => "attempts", :action => "index"
  # get "/attempts/:id", :controller => "attempts", :action => "show"

  # UPDATE
  # get "/attempts/:id/edit", :controller => "attempts", :action => "edit"
  # post "/update_attempt/:id", :controller => "attempts", :action => "update"

  # DELETE
  # get "/delete_attempt/:id", :controller => "attempts", :action => "destroy"
  #------------------------------

  # Routes for the Character resource:
  # CREATE
  # get "/characters/new", :controller => "characters", :action => "new"
  # post "/create_character", :controller => "characters", :action => "create"

  # READ
  get "/characters", :controller => "characters", :action => "index"
  get "/characters/:id", :controller => "characters", :action => "show"

  # # UPDATE
  # get "/characters/:id/edit", :controller => "characters", :action => "edit"
  # post "/update_character/:id", :controller => "characters", :action => "update"

  # # DELETE
  # get "/delete_character/:id", :controller => "characters", :action => "destroy"
  #------------------------------

  devise_for :users
  #get 'pages/dashboard'

  root "pages#dashboard"

  post "/save_game_data", :controller => "pages", :action => "save"
  post "/save_points", :controller => "pages", :action => "savepoints"

  get "/game_page", :controller => "pages", :action => "show"

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
