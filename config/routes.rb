Rails.application.routes.draw do
  
  root'pages#home'  
  
  get '/home', to: 'pages#home'
  
  resources :ideas do
    member do
      post 'like'
    end
      resources :reviews, only: [:new, :create, :show]
  end
  
  resources :marketers, except: [:new, :destroy]
  
  get '/register', to: 'marketers#new'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  
  

  

end