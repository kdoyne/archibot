ArchibotApp::Application.routes.draw do
  resources :architects do
    resources :buildings
  end

  resources :users

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#delete"

  root "splash#index"

  get "/buildings", to: "buildings#index"

end
