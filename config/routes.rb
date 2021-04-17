Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#home' # The root
  get "tasks", to: "tasks#all", as: :tasks # As a user, I can list tasks READ
  get "tasks/new", to: "tasks#new" # The `new` route needs to be *before* `show` route. CREATE - step 1.
  get "tasks/:id", to: "tasks#show", as: :task # As a user, I can view the details of a task READ
  post "tasks", to: "tasks#create" # CREATE - step 2.
  get "tasks/:id/edit", to: "tasks#edit" # Update - Step 1, GET the form
  
end
