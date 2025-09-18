module Student::Notifications
  extend ActiveSupport::Concern

  included do
   has_many :courses , dependent: :destroy
   
   after_update_commit :notify_course, if: :back_in_stock?
  end

 def back_in_stock?
    inventory_count_previously_was.zero? && inventory_count > 0
    #inventory_count_previously_was is a method provided by Active Record
    #-> it returns the previous value of the inventory_count attribute before the last update.
    #-> it checks if the inventory_count was zero before the update and is now greater than zero.
    #-> If both conditions are true, it means the product has come back in stock.
   end
  end

  def notify_subscribers
    # Notify all subscribers that the product is back in stock
    subscribers.each do |subscriber|
      StudentMailer.with(student: self, course: course).in_course.deliver_later
    end
  end

