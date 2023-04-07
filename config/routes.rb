Rails.application.routes.draw do
  root to: "homes#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :homes, only: [:index, :show]

  resources :properties do
    collection do
      get :export_xlsx
      get :export_pdf
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
