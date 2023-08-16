class Addresses::SearchTextService < ApplicationService
  def initialize(params)
    @address = params.parameterize
  end

  def call
    response = ::SearchTextApi.new(@address).search
    build_response(response)
  end

  private

  def build_response(response)
    {
      status: response.status,
      body: JSON.parse(response.body)['results'].slice(0, 5)
    }
  end
end
