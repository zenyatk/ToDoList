Rails.application.routes.draw do
  delete 'tasks/:id' => 'tasks#destroy', as: :task_delete
  resources :tasks do
    collection do
      get 'completed_tasks', to: 'tasks#completed_index'
    end
    member do
      patch 'complete', to: 'tasks#complete'
    end
  end
  root 'tasks#index', as: 'tasks_root'
  get "up" => "rails/health#show", as: :rails_health_check
end

