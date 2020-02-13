Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "dashboard#index"
  end

  unauthenticated :user do
    root to: "home#index"
  end
end
