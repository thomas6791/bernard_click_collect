Rails.application.routes.draw do
  #devise_for :users
  root to: "pages#home"
  post "contact_send", to: "pages#contact_send"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
