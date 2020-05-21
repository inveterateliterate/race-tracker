class RacesController < ApplicationController
  def index
    render json: { data: Race.first }
  end
end
