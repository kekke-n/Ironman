class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :clear_flash

  def clear_flash
    flash[:notice] = nil
    flash[:error] = nil
  end
 # protect_from_forgery with: :exception
 # protect_from_forgery with: :null_session
end
