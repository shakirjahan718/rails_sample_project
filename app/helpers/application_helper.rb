module ApplicationHelper
  def current_user?
    session[:user].nil? ? false : true
  end
end
