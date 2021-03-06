Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  namespace :admin do
    root 'base#dashboard'
     resources :items do
       collection do
         post 'import_uri', as: 'import_uri'
       end
       member do
         post :transcode
       end
     end
     resources :collections do
       member do
         post 'add_item', as: 'add_item'
         get 'delete_item/:item_id' => 'collections#delete_item', as: 'delete_item'
       end
     end
     resources :jobs do
       member do
         get :abort_job, as: 'abort_job'
       end
     end

     resources :metadata_fields do
       member do
         post :add_field_to_group
       end
     end

     resources :storages
     resources :shape_tags
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


end
