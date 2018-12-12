Rails.application.routes.draw do
  root 'page#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
