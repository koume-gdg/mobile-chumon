class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def index
    @users = User.all.order('shop_city DESC')
  end

  def show
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  
end
