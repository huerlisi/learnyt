Learnyt::Application.routes.draw do

  match '/calendar' => 'calendar#index', :year => Time.zone.now.year, :month => Time.zone.now.month
  match '/calendar/:year/:month' => 'calendar#index'
  match '/events/:event' => 'calendar#view'
  match '/calendar/:year/:month/:day', :controller => 'calendar', :action => 'day'


  # Root
  get "overview/index"
  root :to => "overview#index"

  # Authorization
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_for :users
  resources :users

  # Application Resources
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
  resources :quiz_assignments
end
