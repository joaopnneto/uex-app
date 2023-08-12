# frozen_string_literal: true

class Addresses::SearchService < ApplicationService
  def initialize(params)
    @zip_code = params.gsub(/-/, '')
  end

  def call
    response = ::ViacepApi.new(@zip_code).search
    build_response(response)
  end

  private

  def build_response(params)
    {
      status: params.status,
      body: params.body
    }
  end
end
