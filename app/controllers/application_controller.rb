class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_url_options
    {:host => Rails.application.config.site_host }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  protected
  def validate_admin!
    authorize! :index, @user, :message => 'У вас нет прав для выполнения этого действия'
  end

end
