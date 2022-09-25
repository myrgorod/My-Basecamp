Rails.application.routes.draw do
  authenticated :user, ->(user){user.admin?} do
  get 'admin', to: 'admin#index'
  get 'admin/projects'
  get 'admin/discussions'
  get 'admin/users'
  get 'admin/project/:id', to: "admin#show_project",as: 'admin_project'
  end

  get 'search', to: "search#index"

  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
}
  
  get '/u/:id', to: 'users#profile', as: 'user'

  resources :projects do
    resources :discussions
  end
 
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
