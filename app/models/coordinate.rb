# frozen_string_literal: true

class Coordinate < ApplicationRecord
  belongs_to :address

  validates :longitude, :latitude, presence: true
end
