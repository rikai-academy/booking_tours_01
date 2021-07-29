class UsersController < ApplicationController
  before_action :load_user, only: :show
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = t("users.new.welcome")
      redirect_to @user
    else 
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :address,
                                   :phone_number, :date_of_birth,
                                   :password, :password_confirmation)
    end
    
    # Before filters
    
    # Find a user
    def load_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("users.shared.not_found")
      redirect_to root_url
    end
end