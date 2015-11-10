class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from NoMethodError, :with => :render_404

  def render_404
    render("public/404.html")
  end
end
