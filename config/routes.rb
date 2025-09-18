Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # get "/students", to: "students#index", #router index

  #-> This router tell Rails to look for the GET request to the "/students" path
  #-> In this path we choose students#index for this request
  #->When Rails see a request match, it wil send the requent to StudentsController
  #-> and call the index action of that controller
  #=> This is how the Rails process the request and send back a response

  # post "/students", to: "students#create" #router create

  # get "/students/:id", to: "students#show" # -> router show
  #->This router have :id in the path-> this is call Parameter
  #-> and it will write a points of the URL to be use later to process the request
  # *Router parameters don't need to always a Integer 
  # -> it can be a String or another data type

  
  # get "/students/new", to: "students#new" # router new

  # get "/students/:id/edit", to: "students#edit" # router edit

  # patch "/students/:id", to: "students#update" # router update(partical) -> because use patch

  # put "/students/:id", to: "students#update" # router update(full) -> because use patch

  # delete "/students/:id", to: "students#destroy" # router destroy

  #The action write a lot of router for us is really waste of time
  #-> we can use  resources :students
  #-> Rails will auto generate all of the router 
  # we can use the command "rails router" to check what router we have 

  resources :students

  root "students#index" #-> in mean we go website with path"/" it will direct to this page
  #-> app/views/students/index.html.erb
  #-> now when you go to localhost:3000 it will direct to students#index
end


#We have 8 type of router (typical)

# Index -> show all of the record we have

# New -> render a form to create a new record

# Create -> Process the new form submission , and handling the error  
# and creating a record in the database

# Show -> render the details of a specific  record  for viewing

# Edit -> render a form to updating a specific record 

#Update(full) ->Handles the edit form submission, handling errors 
# and updating the entire record, and typically triggered by a PUT request.

#Update(partical) ->  Handles the edit form submission, handling errors
#and updating specific attributes of the record, and typically triggered by a PATCH request.

#Destroy -> delete a specific record from the database