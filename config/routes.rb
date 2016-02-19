Rails.application.routes.draw do
  devise_for :users
  root    'articles#index'
  get     'articles/new'  =>  'articles#new'
  post    'articles'      =>  'articles#create'
  get     'articles/:id' =>  'articles#show', as: 'article'
  get     'users/:id'     =>  'users#show', as: 'user_show'
end
