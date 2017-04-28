class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    redirect_to root_path, alert: "you are not authorized to access this page"
  end
end
