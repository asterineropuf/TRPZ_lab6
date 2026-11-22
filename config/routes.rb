Rails.application.routes.draw do
  root "places#index"

  resources :districts, only: [:index, :show]

  resources :places do
    collection do
      get :accessible
    end

    resource :accessibility_passport, only: [:new, :create, :edit, :update, :destroy]
  end
end