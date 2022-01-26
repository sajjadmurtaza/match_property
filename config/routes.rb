# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  defaults format: :json do
    namespace :api do
      namespace :v1 do
        resources :properties, only: [:index]
      end
    end
  end
end
