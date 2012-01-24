Domotic::Application.routes.draw do

  ActionController::Routing::SEPARATORS << '-' unless ActionController::Routing::SEPARATORS.include? '-'

  resources :lamps do
    get 'page-:page', :action => :show_partial, :on => :collection, :as => :page
  end

  resources :rooms do
    get 'page-:page', :action => :show_partial, :on => :collection, :as => :page
  end

  resources :overview, :only => :index

  delete "light-off/:id" => "lights#destroy", :as => :light_off
  post   "light-on/:id"  => "lights#create",  :as => :light_on
end
