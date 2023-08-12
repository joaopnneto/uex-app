# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :contact
  has_one :coordinate, dependent: :destroy

  accepts_nested_attributes_for :coordinate

  validates :street, :number, :zip_code, :city, :uf, presence: true
end
