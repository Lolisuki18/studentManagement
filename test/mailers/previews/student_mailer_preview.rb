# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/in_course
  def in_course
    StudentMailer.in_course
  end
end
