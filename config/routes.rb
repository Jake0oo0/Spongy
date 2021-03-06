Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :messages

  root 'home#index'

  resources :users do
    get :avatar
    get :about
    get :notifications
  end

  scope '/resources' do
    get '/terms' => 'resources#terms', as: 'terms'
    get '/rules' => 'resources#rules', as: 'rules'
    get '/api' => 'resources#api', as: 'api'
  end

  scope '/admin' do
    get '/' => 'moderation#projects'
    get '/moderation' => 'moderation#projects', as: 'moderation'
    get '/moderation/projects' => 'moderation#projects', as: 'moderation_projects'
    get '/moderation/files' => 'moderation#files', as: 'moderation_files'
  end

  resources :downloads

  resources :authentications
  scope '/auth' do
    get '/', :to => 'authentications#server'
    get '/server', :to => 'authentications#server', :as => 'mc_server'
    post '/server', :to => 'authentications#post_server', :as => 'mc_post_server'
    get '/credentials', :to => 'authentications#credentials', :as => 'mc_credentials'
    post '/credentials', :to => 'authentications#post_credentials', :as => 'mc_post_credentials'
    post '/set_token', :to => 'authentications#set_token'
  end

  resources :plugins do
    resources :comments
    resources :plugin_files, :path => 'downloads' do
      get :deny
      get :approve
      get :download
    end
    resources :plugin_pages, :path => 'pages'
    get :deny
    get :approve
    get :subscribe
    get :unsubscribe

  end

  post '/contact', :to => 'application#contact'
end
