# frozen_string_literal: true

class School < ApplicationRecord
  has_many :courses
  has_many :students
  scope :find_by_name, ->(name) { find_by(title: name) }
end
