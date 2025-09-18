class CourseController < ApplicationController
    allow_unauthenticated_access
    #-> it means we allows unauthenticated access to all action
    before_action :set_student

  def create
    @student.courses.where(course_params).first_or_create
    #first_or_create: It attempts to find the first record matching the conditions specified in course_params.
    #-> If such a record exists, it returns that record.
    #-> If no matching record is found, it creates a new record with the attributes specified in course_params and saves it to the database.
    redirect_to @student, notice: "You are now in course."
  end
    private 
    def set_student
      @student = Student.find(params[:id])
    end

  def course_params
    params.expect(course: [ :email ])
  end

end
