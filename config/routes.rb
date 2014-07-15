require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    member do
      post "follow" => "following_relationships#create"
      delete "Unfollow" => "following_relationships#destroy"
    end
  end
  resources :shouts, only: [:create]
  resource :dashboard, only: [:show]

end
