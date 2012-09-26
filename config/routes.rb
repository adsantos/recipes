Recipes::Application.routes.draw do
  devise_for :users

  resources :steps
  resources :recipes
  resources :ingredients
  get "about"    => "home#about", constraints: {format: :html}
  get "me"    => "home#me", constraints: {format: :html}

  root to: "recipes#index"
end
