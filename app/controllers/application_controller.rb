class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  protected
  def validate_admin!
    authorize! :index, @user, :message => 'Sorry, you have no acces to perform this action'
  end

end
