Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'resume' => 'resume#show'
  post 'send' => 'static_pages#send_message'

  namespace :admin do
    resources :resumes do
      resources :experiences
      resources :skills
      resources :projects
    end
  end
end
