Recipes::Application.routes.draw do
  devise_for :users

  resources :steps
  resources :recipes
  resources :ingredients
  root to: "recipes#index"
end
