class UnderarmourDataController < ApplicationController
  def authenticate
    @link = UnderArmour::Authentication.new.url
  end

  def callback
    @code = params[:code]
    ua_service.authorize
  end

  private

  def ua_service
    ua_service = UnderArmour::Authorization.new(@code)
  end
end
