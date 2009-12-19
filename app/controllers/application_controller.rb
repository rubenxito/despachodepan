# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      (RAILS_ENV == 'test' && username == 'user' && password == 'secret') ||
        (APP_CONFIG['users'].include?(username) && password == APP_CONFIG['password'])
    end
  end

  def data?(name)
    !params[name].nil? && params[name].size > 0
  end

end
