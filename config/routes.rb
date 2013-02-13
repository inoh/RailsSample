WebApp::Application.routes.draw do
  resources :posts, :only => [:new, :create]

  root :to => 'posts#new'
end

