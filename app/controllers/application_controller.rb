class ApplicationController < ActionController::Base
  # before_action :check_login?

  protected

  # def check_login?
  #   login = session[:user].nil? ? false : true
  #   redirect_to login_path unless login  
  # end

  def action1
    Rails.logger.info "...............Action1...................."
  end

  def action2
    Rails.logger.info "...............Action2...................."
  end
  
  
  
end
