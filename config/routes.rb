Rails.application.routes.draw do

  get 'payments/paid'

  # root 'houses#index'

  root 'welcome#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :phone_numbers, only: [:new, :create]
  post 'phone_numbers/verify' => "phone_numbers#verify"

  resources :houses, only: [:create, :new, :index, :show, :destroy] do
    resources :expenses, only: [:index, :create, :destroy, :update, :show] do
      resources :payments, only: [] do
        patch :paid
      end
    end
    resources :chore_items, only: [:create, :index, :destroy, :update]
    resources :shopping_items, only: [:create, :index, :destroy, :update] do
      delete :bought_item
    end 
    resources :commandments, only: [:create, :index, :destroy]
    resources :announcements, only: [:create, :index, :destroy]
    resources :events, only: [:create, :destroy]
    resources :settings, only: [:index]


    patch 'chore_assigner' => 'chore_items#chore_assigner'
    patch 'text_sender' => 'announcements#text_sender'
    patch 'add_housemate' => 'houses#add_housemate'
    patch 'invite_housemate' => 'houses#invite_housemate'


  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
