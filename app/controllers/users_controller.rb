class UsersController < ApplicationController
  before_action :authenticate_user!, only: :saved
  def saved
    @user = current_user
  end
end
