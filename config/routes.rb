Rails.application.routes.draw do
  resources :likes
  get '/accounts/edit', to: 'users#edit'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users , except:[:edit]
  resources :posts , only: [:new , :create,]
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


