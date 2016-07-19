class ApplicationController < ActionController::Base
  before_action :load_categories

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def load_categories
      @categories = Category.all
  end

end
