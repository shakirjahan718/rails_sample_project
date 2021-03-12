Rails.application.routes.draw do
  # get 'login_url', to: 'users#login', as: 'login'
  # post 'users/logout', as: 'logout'
  # post 'users/get_login'
  get 'users/list_users'
  get 'users/my_new_template'
  get 'users/display_other_template'
  get 'users/new_user'
  post "/users/create_user"
  get "/users/show/:id", to: 'users#show', as: 'show_user'
  root to: 'users#list_users'
  
  resources :addresses
  resources :products do
    collection do
      get :premium
      get :by_price
    end
    member do
      get 'set_new_price'
    end
  end

  # =============================================
  #       Specific Action of Resource
  # =============================================
  # resources :addresses, only: [:index, :show]
  # resources :addresses, except: [:index]
  # =============================================
  #      Nested Resources
  # =============================================
  # resources :manufacturers do
  #   resources :products do
  #     resources :comments
  #     collection do
  #       get :premium
  #       get :by_price
  #     end
  #     member do
  #       get 'set_new_price'
  #     end
  #   end
  # end
  # =================================
  #          Namespace 
  # =================================
  # namespace :admin do
  #   resources :comments
  # end

  # namespace :user do
  #   resources :comments
  # end

  # namespace :guest do
  #   resources :comments
  # end
  # =================================

end
