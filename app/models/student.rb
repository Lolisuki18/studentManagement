class Student < ApplicationRecord
  #Validation
  # prevents saving a record without a full_name
  #-> it means the full_name can't be nil or an empty string, it is required.
  validates :full_name, presence: true
  validates :student_code, presence: true, uniqueness: true
  #uniqueness: mean
  # ->ensures that each student_code value is unique 
  # -> Don't have any record have the same student_code value
  

end
