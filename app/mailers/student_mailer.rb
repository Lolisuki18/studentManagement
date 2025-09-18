class StudentMailer < ApplicationMailer
  # use $ bin/rails g mailer Student  để có thể sinh ra cái này
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.in_course.subject
  #
  def in_course
   @student = params[:student]
   # It means we are expecting to receive a parameter named :student

   mail to: params[:course].email
    # It means we are expecting to receive a parameter named :course
    # -> we use course.email to get the email address from the course object
  end
end
