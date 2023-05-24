Rails.application.routes.draw do
  devise_for :users

  root 'tasks#index'

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

  scope :admin do
    resources :users
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :tasks do
    collection do
      get 'search'
    end
  end

end
