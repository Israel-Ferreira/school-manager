# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :school
  scope :find_by_name, ->(name) { where(title: name) }

  def self.get_by_school(school)
    all.select { |course| course.school.title == school }
  end
end
