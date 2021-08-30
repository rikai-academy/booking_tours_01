class CategoriesController < ApplicationController
  before_action :admin_user
  before_action :load_category, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:edit, :new, :create, :update]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.page(params[:page])
  end

  def show
  end

  def create
    if category_params[:parent_id].blank?
      @category = Category.new(category_name: category_params[:category_name]) 
    else
      @category = Category.new(category_params) 
    end

    if @category.save
      flash[:success] = t("categories.new.success")
      redirect_to categories_path
    else 
      flash[:danger] = t("categories.shared.fail")
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = t("categories.edit.success")
      redirect_to categories_path
    else
      flash[:danger] = t("categories.shared.fail")
      redirect_to categories_path
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t("categories.destroy.success")
    else
      flash[:danger] = t("categories.shared.fail")
    end
    redirect_to categories_url
  end

  private

    def category_params
      params.require(:category).permit(:category_name, :parent_id)
    end
  
    def load_category
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("categories.shared.fail")
      redirect_to categories_path
    end 
end
