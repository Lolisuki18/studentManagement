class Course < ApplicationRecord
  belongs_to :student
  # belongs_to :student means that each course record is associated with one student.
  # This sets up a one-to-many relationship where a student can have many courses,
  # but each course belongs to a single student.
  # We need go to student model to set up the other side of the relationship
  # -> has_many :courses
end
