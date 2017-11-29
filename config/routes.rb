Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show] do
    get :my_perfil, on: :collection
    get :questions, on: :collection
    get :skills
  end
  resource :user, only: [:show] do
    get :questions, on: :collection
    get :skills
    get '/public' => 'users#public'
    get '/question_votes' => 'users#question_votes'
    get '/answers' => 'users#answers'
  end
  resources :questions do
    get :without_answer, on: :collection
  end
  resources :questions do
    resources :best_answer, only: [:update], action: :best_answer, controller: 'answers'
  end
  resources :answers, only: [:show, :destroy, :create, :update]
  resources :answer_comments, only: [:index, :destroy, :create, :update]
  resources :question_comments, only: [:index, :destroy, :create, :update]
  resources :tags, only: [:index, :show, :destroy, :create, :update]
  resources :votes, only: [:create, :update]
  resources :skills
  resources :faculties, only: [:index, :show, :destroy, :create, :update]

  get 'main/welcome'
  root "main#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
