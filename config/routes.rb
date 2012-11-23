RailsPrelaunchSignup::Application.routes.draw do

  authenticated :user do
    #root :to => 'home#index'
    root :to => 'change_world_projects#index'
    match '/export' => "change_world_projects#export_to_csv"
  end                                                   #  , :constraints => {:format => :csv}

  #resources :change_world_projects, :path => 'changeworld'

  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation

    # resources :groups
    #resources :site_settings, :path => 'settings'
    resources :change_world_projects, :path => 'changeworld'
  end

  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }

  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite

  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end

end