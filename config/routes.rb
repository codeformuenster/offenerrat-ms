Offenerrat::Application.routes.draw do
  root :to => 'pages#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :vorlage, only: [:index,:show] do
    collection do
      get 'all'
      get 'beschlossene'
      get 'in_beratung'
    end
  end
  resources :gremium, only: [:index,:show]
  resources :sitzung, only: [:index,:show]
  resources :subjects, only: [:index,:show]
  resources :documents, only: [:index,:show]
  resources :districts, only: [:index,:show]
  resources :notifications, only: [:create,:destroy]
  
  match 'notifications/authentication/:token' => 'notifications#authentication', :as => :notification_authentication
  match "/gremien" => 'gremium#index'
  match "/vorlagen" => 'vorlage#index'
  match "/vorlagen/alle" => 'vorlage#all'

  match "/sitzungen" => 'sitzung#index'


  match "/search" => 'search#index'
  match "/impressum" => 'pages#impressum'
  match "/whatsnew" => 'pages#whatsnew'

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
