# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy
  has_one :coordinate, through: :address

  accepts_nested_attributes_for :address

  validates :name, :phone, presence: true
  validates :cpf, presence: true, uniqueness: true
end
