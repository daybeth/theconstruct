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

#28739D
  # Project Routes
  get 'projects' => 'projects#index'

  get 'projects/new' => 'projects#new'

  post 'projects' => 'projects#create'

  get 'projects/:id' => 'projects#show'

  get 'projects/:id/edit' => 'projects#edit'

  patch 'projects/:id' => 'projects#update'

  delete 'projects/:id' => 'projects#destroy'


  # Comments Routes

  post 'comments' => 'comments#create'

  delete 'comments/:id' => 'comments#destroy'
  

  # Messages Routes

  get 'messages' => 'messages#index'

  post 'messages' => 'messages#create'

  get 'messages/:id' => 'messages#show'

  delete 'messages/:id' => 'messages#destroy'


end
