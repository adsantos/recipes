Recipes::Application.routes.draw do
  resources :steps
  resources :recipes
  resources :ingredients
  root to: "recipes#index"
end
