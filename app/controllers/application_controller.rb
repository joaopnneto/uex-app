# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    headers = request.headers['Authorization'].presence
    @current_user ||= User.find_by_auth_token(headers.present? ? headers.split(' ').second : nil)
  end
end
