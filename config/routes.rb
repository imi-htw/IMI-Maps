ImiMaps::Application.routes.draw do

  get "password_resets/new"

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    resources :internships, :only => [:edit, :show, :index, :destroy, :update]

    resources :companies

    resources :users

    resources :user_verifications

    resources :search, :only => [:index]

    resources :overview, :only => [:index]

    resources :internship_offer, :only => [:index, :show]

    resources :notifications, :only => [:destroy, :show]

    resources :favorite, :only => [:create, :destroy]

    resources :location, :only => [:create, :destroy]

    resources :sessions

    resources :user_comments

    resources :answers

    resources :general

    resources :faq

    resources :financing

    resources :download

    resources :internship_searches

    resources :quicksearches, :only => [:index]

    resources :companies_compare

    resources :favorite, :only => [:index]

    resources :favorite_compare

    resources :password_resets

    resources :errors, :only => [:not_found]

		root to: 'sessions#new'

    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    match "*path", to: "errors#not_found"
    
	end

  root to: 'sessions#new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match '*path', to: redirect {|params| "/#{I18n.default_locale}/#{CGI::unescape(params[:path])}" }
	match '', to: redirect("/#{I18n.default_locale}/") , constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }

  
  match 'de', to: redirect("/de/sessions#new")
  match 'en', to: redirect("/en/sessions#new")
  match 'id', to: redirect("/id/sessions#new")
 
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
