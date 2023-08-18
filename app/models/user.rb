# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  has_many :contacts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, on: :update
  validates :password_confirmation, presence: true, on: :update

  before_save :authenticate_token, :validate_password

  private

  def authenticate_token
    self.auth_token ||= generate_user_token
  end

  def generate_user_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(auth_token: token)
    end
  end

  def validate_password
    self.password.eql? self.password_confirmation
  end
end
