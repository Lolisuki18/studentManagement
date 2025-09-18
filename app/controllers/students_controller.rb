class StudentsController < ApplicationController
  
  allow_unauthenticated_access only: %i[index show]
  #-> it means we allows unauthenticated access to 
  #index and show action
  #-> other action need authentication

  before_action :set_student, only: %i[ show edit update destroy ]
  #-> before_action allows share code  between actions and run before call of action

  # %i is a shorthand for an array of symbols in Ruby.
  # example: 
  # only: %i[ show edit update  ]
  # only: [:show, :edit, :update]

  def index
    @students = Student.all #-> instance variable -> variables that start with an @
    #-> this variable can share the data in the view
  end

  def show
    # @student = Student.find(params[:id]) -> use before_action :set_student
    #To query in the database we use params to access the request parameters
    #in this case we use the :id from route /students/:id
  end

  def new
    @student = Student.new
  end

   def create
     @student = Student.new(student_params)
    if @student.save # tells Active Record to run validations and save the record to the database.
      redirect_to @student # redirect to the show page of the newly created student
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    # @student = Student.new(student_params)-> use before_action :set_student
  end

  def update
    #  @student = Student.new(student_params)-> use before_action :set_student
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    # We use before_action :set_student
    #-> it stand for @student = Student.find(params[:id])
    #We don't need to write again
    @student.destroy
    redirect_to students_path
  end

    #We always need an existing database record ->  @student = Student.find(params[:id])
     # in show, edit , update ,.... we can deduplicate this into "before_action"
    #-> before_action allows share code  between actions and run before call of action

    # in here we use @student = Student.find(params[:id]) in show, edit , update 
    #-> We can use before_action to share this code and this helps we don't duplicate code
    #- > this good for DRY ( Don't Reapeat Yourself)

  private
    def set_student # use in before_action in a head
      @student = Student.find(params[:id])
    end

    def student_params #Strong Parameters
      params.expect(student: [ :full_name, :age, :student_code, :email, :phone, :major, :address, :birthday, :active])
    end
    #The action create is hanlding the data submission
    #-> this data need to filter to security
    #-> It is the time we use student_params

    # student_params 
    #-> we tell Rails to check the param and ensure there
    # -> there is a key named :product with an array of parameters as the value
    #-> Rails will don't care any parameter we don't list in the arrray
    # This protects our application from malicious users who might try to hack our application.
end
