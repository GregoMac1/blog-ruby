Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments
  end
  put "posts/:id/hide", to: "posts#hide", as: "hide_post"
  put "posts/:id/unhide", to: "posts#unhide", as: "unhide_post"
  
  post "comments/typing", to: "comments#typing"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create", as: "log_in"
  get "logout", to: "sessions#destroy"
end
