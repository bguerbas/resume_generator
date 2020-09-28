class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[sign_up]
end
