Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show] do
    get :my_perfil, on: :collection
  end

  resources :questions
  resources :answers, only: [:destroy, :create, :update]
  resources :answer_comments, only: [:index, :destroy, :create, :update]
  resources :question_comments, only: [:index, :destroy, :create, :update]
  resources :tags
  resources :votes

  get 'main/welcome'
  root "main#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
