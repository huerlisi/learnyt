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

  # Contacts
  resources :people
  resources :teachers, :controller => :people
  resources :students, :controller => :people
  resources :parents, :controller => :people
  
  # Quiz
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
  match '/quiz_responses/archive' => 'quiz_responses#archive_index'
  resources :quiz_responses do
    put 'archive'
    put 'recover'
  end
  resources :quiz_assignments do
    resources :quiz_responses
  end
  resources :e_mails
  # Calendar
  match '/calendar' => 'calendar#index', :year => Time.zone.now.year, :month => Time.zone.now.month
  match '/calendar/:year/:month' => 'calendar#index'
  match '/events/:event' => 'calendar#view'
  match '/calendar/:year/:month/:day', :controller => 'calendar', :action => 'day'
end
