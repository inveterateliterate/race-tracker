class ApplicationController < ActionController::Base
  include RailsUtil::JsonHelper
  include RailsUtil::ReactHelper
  # protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
