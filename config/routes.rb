Recipes::Application.routes.draw do
  resources :recipes
  resources :ingredients
  root to: "recipes#index"
end
