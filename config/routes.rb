LittleWorld::Application.routes.draw do

  resources :friends do
    get 'search', :on => :collection
  end
  
  root to: 'friends#index'
  
end
