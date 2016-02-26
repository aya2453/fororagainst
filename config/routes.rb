Rails.application.routes.draw do
  devise_for :users
  root    'articles#index'
  get     'articles/new'  =>  'articles#new'
  get     'articles/search' => 'articles#search'
  post    'articles'      =>  'articles#create'
  get     'articles/:id' =>  'articles#show', as: 'article'
  get     'users/:id'     =>  'users#show', as: 'user_show'
  post    'articlelike/:article_id' => 'articlelikes#create', as: 'articlelike'
  delete  'articleunlike/:article_id' => 'articlelikes#destroy', as: 'articleunlike'
  resources :articles do
    resources :comments
    member do
      put 'pro' => 'articles#pro'
      put 'con' => 'articles#con'
    end
  end
  resources :users, only: [] do
    member do
      get :articlelike_notes
    end
  end
end
