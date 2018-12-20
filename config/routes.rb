Rails.application.routes.draw do
   
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",  
      only: [:create, :edit, :update]
    end
  resources :users do
    resources :groceries
    get '/recipes' => "groceries#show_ingredients"
    post '/recipes' => "groceries#recipes"
    get '/result' => "groceries#result"
    get '/expiries' => "groceries#expiries"
    get '/expired' => "groceries#expired"
  end
  # resources :groceries
  
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  # CUSTOM ROUTES 
  post '/voice', to: 'groceries#voice_analyse'
  post '/ocr', to: 'groceries#ocr_analyse'
  post '/push', to: 'groceries#push'
  post '/search', to: 'search#identify'
  post '/index_search', to: 'search#find'


end
