class Student < ApplicationRecord
  # include Notifications

  # Validation
  # prevents saving a record without a full_name
  # -> it means the full_name can't be nil or an empty string, it is required.
  validates :full_name, presence: true
  validates :student_code, presence: true, uniqueness: true
  # uniqueness: mean
  # ->ensures that each student_code value is unique
  # -> Don't have any record have the same student_code value

  has_rich_text :description
  # Need to add :description to strong parameters in controller
  # it means the Student model has a rich text attribute named description.
  # What is rick text ?
  # Rick text is a way to store and display formatted text content,
  # -> such as bold, italics, links, images, and other multimedia elements.
  # -> It allows users to create and edit content with various styles and formatting options.

  has_one_attached :featured_image
  # It is used to associate a single file, such as an image or document
  # , with a record in the Student model.
  # This allows each student to have one featured image attached to their record.
  # It use Active Storage to handle file uploads and attachments.
  # Need to add :featured_image to strong parameters in controller

  # validates :class_count, numericality: { greater_than_or_equal_to: 0 }
  # -> we use stock

  # has_many :courses
  # The relationship between Student and Course models
  # -> A student can enroll in many courses.

  # after_update_commit :notify_course, if: :back_in_stock?
  # after_update_commit:
  # -> This callback is triggered after a record is updated and the changes are committed to the database.
  # -> It means it will call notify_course action if back_in_stock action return true

  #  def back_in_stock?
  #   inventory_count_previously_was.zero? && inventory_count > 0
  #   #inventory_count_previously_was is a method provided by Active Record
  #   #-> it returns the previous value of the inventory_count attribute before the last update.
  #   #-> it checks if the inventory_count was zero before the update and is now greater than zero.
  #   #-> If both conditions are true, it means the product has come back in stock.
  #  end
  # end

  # def notify_subscribers
  #   # Notify all subscribers that the product is back in stock
  #   subscribers.each do |subscriber|
  #     StudentMailer.with(student: self, course: course).in_course.deliver_later
  #   end
end
