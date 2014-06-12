Rails.application.routes.draw do
  root "search#index"
  get "/search/pulls" => "search#pulls", as: "search_pulls"
end
