class Student < ApplicationRecord
  #Validation
  # prevents saving a record without a full_name
  #-> it means the full_name can't be nil or an empty string, it is required.
  validates :full_name, presence: true
  validates :student_code, presence: true, uniqueness: true
  #uniqueness: mean
  # ->ensures that each student_code value is unique 
  # -> Don't have any record have the same student_code value
  
  has_rich_text :description
  #Need to add :description to strong parameters in controller
  #it means the Student model has a rich text attribute named description.
  #What is rick text ? 
  #Rick text is a way to store and display formatted text content,
  #-> such as bold, italics, links, images, and other multimedia elements.
  #-> It allows users to create and edit content with various styles and formatting options.

  has_one_attached :featured_image
  # It is used to associate a single file, such as an image or document
  # , with a record in the Student model.
  # This allows each student to have one featured image attached to their record.
  #It use Active Storage to handle file uploads and attachments.
  #Need to add :featured_image to strong parameters in controller
end
