Rails.application.routes.draw do
  root "search#index"
  get "/search/pulls" => "search#pulls", as: "search_pulls"

  resources :sessions, only: [:new, :create, :destroy]
  get "/auth/:provider/callback" => "sessions#create"
end
