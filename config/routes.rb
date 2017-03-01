Rails.application.routes.draw do

  root 'sessions#index'

  # session routes
  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  get 'sessions/index'


  # Ninja routes

  get 'ninjas/new'

  post 'ninjas' => 'ninjas#create'

  get 'ninjas/:id' => 'ninjas#show'

  get 'ninjas/:id/edit' => 'ninjas#edit'

  patch 'ninjas/:id' => 'ninjas#update'

  delete 'ninjas/:id' => 'ninjas#destroy'


  # Project Routes
  get 'projects/index'

  post 'projects' => 'projects#create'

  get 'projects/:id' => 'projects#show'

  get 'projects/:id/edit' => 'projects#edit'

  patch 'projects/:id' => 'projects#update'

  delete 'projects/:id' => 'projects#destroy'


  # Comments Routes

  post 'comments' => 'comments#create'

  delete 'comments/:id' => 'comments#destroy'

  # Messages Routes

  get 'messages/index'

  post 'messages' => 'messages#create'

  get 'messages/:id' => 'messages#show'

  delete 'messages/:id' => 'messages#destroy'


end
