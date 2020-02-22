# frozen_string_literal: true

class School < ApplicationRecord
  has_many :courses
  has_many :students
  scope :find_by_name, ->(name) { find_by(title: name) }

  validates :title, :owner_email, presence: true
  
  before_validation :valid_subdomain

  def valid_subdomain
    if s_domain.present?
      errors.add(:s_domain, 'Subdomínio Inválido') unless subdomain_is_correct?
    end
  end

  private

  def subdomain_is_correct?
    uri = URI.parser(s_domain)
    uri.is_a?(URI::HTTP) && !uri.Host.nil?
  rescue URI::InvalidURIError
    false
  end
end
