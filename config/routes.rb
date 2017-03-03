Rails.application.routes.draw do

  root 'sessions#index'

  # session routes
  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  get 'sessions' => 'sessions#index'


  # Ninja routes

  get 'ninjas' => 'ninjas#new'

  post 'ninjas' => 'ninjas#create'

  get 'ninjas/:id' => 'ninjas#show'

  get 'ninjas/:id/edit' => 'ninjas#edit'

  patch 'ninjas/:id' => 'ninjas#update'

  delete 'ninjas/:id' => 'ninjas#destroy'


  # Project Routes

  get 'projects' => 'projects#index'

  get 'projects/new' => 'projects#new'

  post 'projects' => 'projects#create'

  get 'projects/:id' => 'projects#show'

  get 'projects/:id/edit' => 'projects#edit'

  patch 'projects/:id' => 'projects#update'

  delete 'projects/:id' => 'projects#destroy'

  get 'projects/swift' => 'projects#swift'

  get 'projects/php' => 'projects#php'

  get 'projects/js' => 'projects#js'

  get 'projects/ror' => 'projects#ror'

  get 'projects/csharp' => 'projects#csharp'


  # Comments Routes

  post 'comments' => 'comments#create'

  delete 'comments/:id' => 'comments#destroy'
  

  # Messages Routes

  get 'messages/:id/new' => 'messages#new'

  post 'messages/:id' => 'messages#create'

  get 'messages/:id' => 'messages#show'

  delete 'messages/:id' => 'messages#destroy'

    # Teams Routes

  post 'teams/:id' => 'teams#create'

  delete 'teams/:id' => 'teams#destroy'


end
