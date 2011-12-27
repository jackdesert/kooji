Regi::Application.routes.draw do
  resources :registrations


  # for some reason, when I delete this line, then my /1/edit url complains "no route matches :controller => :events"
  resources :events

  resource :user_session
  resource :user

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action




match 'support' => 'imports#support', :as => 'support_page'
match 'hbtrips' => 'imports#featured_events', :as => 'hbtrips'

# custom routes to do some of what 'resources :events' would do, but without the word 'events' at the front
match ':id' => 'events#show', :via => 'get', :as => 'event'
match ':id' => 'events#update', :via => 'put'
match ':id/edit' => 'events#edit', :as => 'edit_event', :via => 'get'
match 'new' => 'events#new', :as => 'new_event', :via => 'get'
match 'create' => 'events#create', :via => 'post'
match ':id/roster' => 'events#roster'
match ':id/roster/export' => 'events#export', :as => 'roster_export'
match ':id/share' => 'events#get_the_word_out', :as => 'publicize'











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
