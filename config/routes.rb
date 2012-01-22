Regi::Application.routes.draw do



  get 'password_reset/edit/:token' => 'password_resets#edit', :as => 'edit_password_reset'
  put 'password_reset_submit' => 'password_resets#update', :as => 'password_reset_submit'
  resource :password_reset

  # for some reason, when I delete this line, then my /1/edit url complains "no route matches :controller => :events"

  get 'login' => 'user_sessions#new', :as => 'new_user_session'
  resource :user_session
  resource :user, :path => "profile"

  # The priority is based upon order of creation:

  # first created -> highest priority.
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Add ability to log out from a URL
  get 'logout' => 'user_sessions#destroy', :as => 'logout', :via => 'delete'

  get 'profile' => 'users#show', :as => 'view_profile'
  get 'support' => 'imports#support', :as => 'support'
  get 'hbtrips' => 'imports#featured_events', :as => 'hbtrips', :via => :get

  # custom routes to do some of what 'resources :events' would do, but without the word 'events' at the front
  get ':id/carpooling' => 'events#carpooling', :as => 'carpooling'
  get ':id/roster' => 'events#roster', :as => 'roster'
  get ':id/roster/:anchor' => 'events#roster', :as => 'roster_with_anchor', :anchor => /\d*/
  get ':id/roster/export' => 'events#export', :as => 'roster_export'
  get ':id/share' => 'events#get_the_word_out', :as => 'share_event'

  resources :events, :path => "/", :except => [:index, :delete] do
    resource :registration
  end


  namespace :admin do
    resources :users
    get 'prospective_leaders' => 'users#index_prospectives', :as => 'index_prospectives'
    get 'search' => 'users#search', :as => 'search'
    put 'update_user_type' => 'users#update', :as => 'update_user_type'
  end

  get 'profile/edit' => 'users#edit', :as => 'edit_profile'

  put 'update_register_status' => 'registrations#update_register_status', :as => 'update_register_status'








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
  root :to => 'registrations#mine'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
