class Api::V1::ServicesController < Api::BaseController

  def index
    results = []

    Service.all.each do |service|
      result = service.attributes
      result[:service_items] = service.service_items.all
      results << result
    end

    render json: { results: results }
  end
end