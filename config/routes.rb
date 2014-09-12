Rails.application.routes.draw do

  root :to => 'posts#index'

  get 'posts_ng', :to => 'posts#ng_post'

  post 'posts_ng_add', :to => 'posts#ng_post_add'

  # resources :posts do
  #   get 'page/:page', :action => :index, :on => :collection
  #   resources :post_comments
  # end
  #
  # resources :tags
  #
  # get 'about', to: 'home#about', as: :about
  #
  # get '/user/panel', to: 'posts#panel', :as => :panel
  #
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # devise_for :users

end
