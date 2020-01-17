Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stories 
  get :view_all_stories, to: 'stories#view_all_stories'
    root :to => "homes#index"

end
