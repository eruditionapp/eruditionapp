Rails.application.routes.draw do

  devise_for :users, controllers: { sessions:      'sessions',
                                    registrations: 'registrations' }

  root                         'static#home'
  get 'privacy'             => 'static#privacy'
  get 'users/:id/:deck_id/preview' => 'users#deck_preview'
  get 'learn/:id/:deck_id'                     => 'learn#index'
  get 'learn/:id/:deck_id/get-card-prompt'     => 'learn#get_card_prompt'
  post 'learn/:id/:deck_id/post-user-response' => 'learn#post_user_response'
  post 'learn/:id/:deck_id'                    => 'learn#create_card_response'

  resources :users
  resources :decks do
    resources :cards, except: :index
    resources :quotes
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
