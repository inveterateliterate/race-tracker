class UnderarmourDataController < ApplicationController
  def authenticate
    @link = UnderArmour::Authentication.new.url
  end

  def callback
    @code = params[:code]
    ua_service.authorize ? redirect_to(root_path) : raise('error retrieving access token')
  end

  private

  def ua_service
    @ua_service ||= UnderArmour::Authorization.new(code: @code)
  end
end
