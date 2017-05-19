class UnderarmourDataController < ApplicationController
  def authenticate
    @link = UnderArmour::Authentication.new.url
  end

  def callback
    @code = params[:code]
    if ua_service.authorize
      user = User.find_by(email: ENV['ADMIN_EMAIL'])
      user.update(access_token: ua_service.access_token, ua_user_id: ua_service.user_id)
      redirect_to root_path
    else
      raise 'error retrieving access token'
    end
  end

  def fetch_and_send_data
    # rename / put in rake task
    # get ua activity data with service
    # pass data to twitter service
  end

  private

  def ua_service
    ua_service ||= UnderArmour::Authorization.new(code: @code)
  end
end
