Rails.application.routes.draw do
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

  get 'users/login', as: 'logout'
  post 'users/logout'
  post 'users/get_login', as: 'login'
  get 'users/list_users'
  get 'users/my_new_template'
  get 'users/display_other_template'
  get 'users/new_user'
  post "/users/create_user"
  get "/users/show/:id", to: 'users#show', as: 'show_user'
  root to: 'users#list_users'
end
