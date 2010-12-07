Learnyt::Application.routes.draw do
  # Root
  get "welcome/index"
  root :to => "welcome#index"

  get "overview/index"

  # Authorization
  devise_for :users
  resources :users do
    member do
      post :unlock
    end
    collection do
      get :current
    end
  end

  # Application Resources
  resources :people
  resources :questions do
    resources :responses
    resources :possible_answers
  end
  resources :answers
  resources :possible_answers
  resources :responses
  resources :quizzes do
    resources :quiz_responses
  end
  resources :quiz_responses
  resources :quiz_assignments do
    resources :quiz_responses
  end

  # Calendar
  match '/calendar' => 'calendar#index', :year => Time.zone.now.year, :month => Time.zone.now.month
  match '/calendar/:year/:month' => 'calendar#index'
  match '/events/:event' => 'calendar#view'
  match '/calendar/:year/:month/:day', :controller => 'calendar', :action => 'day'
end
