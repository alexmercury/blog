Blog1::Application.routes.draw do

  root :to => 'posts#index'

  resources :posts do
    get 'page/:page', :action => :index, :on => :collection
  	resources :bcomments
  end

  resources :tags

  match '/user/panel' => "posts#panel", :as => :panel

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users
end
