Nejpms::Application.routes.draw do
  resources :inventory_clearances


  resources :inventory_clearance_settings,only: [:index] do
    collection do
      get :select
    end
  end


  resources :asset_list_masters, only: [:index,:show] do
    collection do
      get  :select
      post  :index
      get  :back2
    end
    member do
      get :tran_show
    end
  end

  resources :corp_locations

  resources :management_accounts

  resources :wallet_journals

  resources :market_orders


  resources :product_sales


  resources :costs

  resources :product_results do
    collection do
      get  :select
      post  :new2
    end
  end

  resources :user_lists

  resources :asset_lists do
    collection do
      post 'search'
    end
  end

  resources :blue_print_purchases

  resources :material_purchases

  resources :manufacturing_costs, only: [:index]

  resources :material_shortages, only: [:index, :show] do
    collection do
      get :select
      post:index
      post :confirm
    end
  end

  resources :inventory_transitions, only: [:index, :show]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
