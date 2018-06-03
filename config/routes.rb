Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  # scope '/admin', module: 'admin' do
  # NOTE : Replace "scope/module" with "namespace" when using both of the same
    # If moving from "scope" to "namespace" -> Need to remember to update all URL helpers
  namespace :admin do
    resources :stats, only: [:index]
  end


  root 'posts#index'
end
