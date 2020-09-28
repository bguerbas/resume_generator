class PersonalInfosController < ApplicationController
  def new
    @personal_info = PersonalInfo.new(params)
  end

  def create

  end

  private

  def params

  end
end
