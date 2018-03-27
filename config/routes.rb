Rails.application.routes.draw do
  root to: 'home#show'

  namespace :api do
    namespace :v1 do
      resources :ratings, only: %i[show create]
      resources :reputations, only: %i[show]
    end
  end
end
