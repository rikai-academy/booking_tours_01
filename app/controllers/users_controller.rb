class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: [:show, :destroy]
  before_action :admin_user, only: [:destroy, :index]
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def index
    if (params[:page].blank?)
      @users =  User.search(params[:term]).page(Settings.Paginate.default_page)
    else
      @users = User.search(params[:term]).page(params[:page])
    end
  end

  def show
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      log_in @user
      flash[:success] = t("users.new.welcome")
      UserMailer.welcome_email(@user).deliver_now 
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

  def destroy
    if @user.destroy
      flash[:success] = t("users.index.deleted")
    else
      flash[:danger] = t("users.index.failed")
    end
    redirect_to users_url
  rescue ActiveRecord::InvalidForeignKey
    flash[:danger] = t("users.index.failed")
    redirect_to users_url
  end
  
  private
  
    # Before filters
    
    # Find a user
    def load_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("users.shared.not_found")
      redirect_to root_url
    end
end
