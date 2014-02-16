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

  post "/architects/:architect_id/buildings/:id/favorite", to: "buildings#favorite", as: "favorite"
  post "/architects/:architect_id/buildings/:id/favorite", to: "buildings#unfavorite", as: "unfavorite"

end

