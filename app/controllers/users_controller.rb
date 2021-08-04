class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: :show
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      log_in @user
      flash[:success] = t("users.new.welcome")
      redirect_to @user
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t("users.edit.updated")
      redirect_to @user
    else
      render :edit
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

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("users.shared.not_right")
      redirect_to root_url
    end
end