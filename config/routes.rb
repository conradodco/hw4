Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
  # Login/out
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
end
