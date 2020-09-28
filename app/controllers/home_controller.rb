class HomeController < ApplicationController
  def sign_up
    redirect_to new_user_registration_path
  end
end
