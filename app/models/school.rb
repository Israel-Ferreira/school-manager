# frozen_string_literal: true

class School < ApplicationRecord
  has_many :courses

  scope :find_by_name, ->(name) { find_by(title: name) }

  def self.find_schools_by_course(course_name)
    schools = all.collect do |school|
      course = school.courses.find_by(title: course_name)
      course.present? ? school : nil
    end

    schools.reject(&:nil?)
  end
end
