class UsersController < ApplicationController

  def index
    @users = User.all.order('shop_city DESC')
  end
  
end
