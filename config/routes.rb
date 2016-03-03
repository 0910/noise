Rails.application.routes.draw do
  
  get 'domains/dispatch'

  get 'videos/index'

  resources :festivals, only: [:show, :index] do
    resources :events, only: [:show, :index] do
    end
    resources :shows, only: [:show, :index] do
    end
    resources :artists, only: [:show, :index] do
    end
    resources :venues, only: [:show, :index] do
    end
    resources :news, only: [:show, :index] do
    end
    resources :videos, only: [:show, :index] do
    end
    resources :sponsors, only: [:index] do
    end
    resources :newsletters, only: [:new, :create]
    resources :contacts, only: [:new, :create]
  end

  devise_for :festivals, ActiveAdmin::Devise.config.merge({path: '/admin'})
  devise_for :admin_users, ActiveAdmin::Devise.config.merge({path: '/super_admin'})
  ActiveAdmin.routes(self)
  
  root to: "festivals#lookup"

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

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
