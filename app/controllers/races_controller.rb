class RacesController < ApplicationController
  def home
    render json: { data: Race.first }
  end
end
