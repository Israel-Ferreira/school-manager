class Student < ApplicationRecord
  belongs_to :course
  
  def set_active
    if active.nil?
      self.active = true
    end
  end
end
