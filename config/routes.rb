Rails.application.routes.draw do
  get 'sessions/new'
  resources :users

  #タスク一覧のルーティング
  get '/tasks', to: 'tasks#index'
  #タスク詳細画面へのルーティング
  get '/tasks/:taskid', to: 'tasks#show'
  #タスク追加画面へのルーティング
  get '/tasks/new', to: 'tasks#new'
  #タスク編集画面へのルーティング
  get '/tasks/:taskid/edit', to: 'tasks#edit'
  #タスク追加画面でPOST時のルーティング
  post '/tasks', to: 'tasks#create'

  post '/tasks/:taskid', to: 'tasks#update'
  #put '/tasks/:taskid/edit', to: 'tasks#update'

  delete '/tasks/:taskid', to: 'tasks#destroy'

  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'sessions#new'
  
  resources :tasks do
    collection do
      get 'search'
    end
  end

end
