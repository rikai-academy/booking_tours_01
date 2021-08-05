class Admin::UsersController < AdminController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      redirect_to users_path
    else  
      render :new
    end
  end
end