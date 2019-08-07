Rails.application.routes.draw do
  # Home
  root to: 'application#home'

  devise_for :lenders, sign_out_via: [:delete]

  scope :lender do
    resources :borrows
    resources :recipients, only: [:index]
    resources :items, only: [:index]
  end
  
  resources :items, except: [:index] do
    resources :recipients
    resources :borrows
  end

  resources :recipients, except: [:index] do
    resources :items
    resources :borrows
  end

end
