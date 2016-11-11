Rails.application.routes.draw do

  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  # get 'admin_users/index'
  #
  # get 'admin_users/new'
  #
  # get 'admin_users/create'
  #
  # get 'admin_users/edit'
  #
  # get 'admin_users/update'
  #
  # get 'admin_users/delete'
  #
  # get 'admin_users/destroy'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :sections do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get 'demo/escape_output'
  # get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
