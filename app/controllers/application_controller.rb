class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in user.
  def logged_in_user
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to login_url
  end
end
