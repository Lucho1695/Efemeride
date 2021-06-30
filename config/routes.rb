Rails.application.routes.draw do
  root 'categories#index'

  resources :categories
  resources :efemerides do
    member do
      get 'show_small_image'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
