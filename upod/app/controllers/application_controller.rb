class ApplicationController < ActionController::Base
  before_action :load_categories

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
      root_path
  end

  private
  def load_categories
      @categories ||= Category.all
  end

end
