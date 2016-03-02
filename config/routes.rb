Rails.application.routes.draw do
  root "categories#index"

  resources :user_sessions

  resources :users do
    resources :experiences
    resources :requests
    resources :messages
  end

  resources :responses do
    resources :messages
  end

  resources :categories do
    resources :requests
  end


  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

    # User
    #   - create
    #   - new
    #   index
    #   - show
    #   - update
    #   - edit
    #   - delete
    #
    # Messages
    #   - create
    #   - new
    #   - index
    #   - show
    #   update
    #   edit
    #   delete
    #
    # Requests
    #   - create
    #   - new
    #   - index
    #   - show
    #   update
    #   edit
    #   - delete
    #
    #   Responses
    #   - create
    #   - new
    #   - index
    #   - show
    #   update
    #   edit
    #   - delete
    #
    #   Categories
    #   create
    #   new
    #   - index
    #   - show
    #   update
    #   edit
    #   delete
    #
    #   Experiences
    #   - create
    #   - new
    #   - index
    #   - show
    #   - update
    #   - edit
    #   - delete

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
