class HomeController < ApplicationController
  def index; end

  def sign_in
    redirect_to new_user_registration_path
  end
end
