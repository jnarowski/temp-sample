class Api::BaseController < ApplicationController

  def index
    results = []

    Service.all.each do |service|
      result = service.attributes
      result[:service_items] = service.service_items.all
    end

    json_response(results: results)
  end
end