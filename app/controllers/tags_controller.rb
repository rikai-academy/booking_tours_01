class TagsController < ApplicationController
  before_action :admin_user
  before_action :load_tag, only: [:show, :edit, :update, :destroy]

  def new
    @tag = Tag.new
  end

  def index
    @tags = Tag.page(params[:page])
  end

  def show
  end

  def create
    @tag = Tag.create(tag_params) 
    if @tag.save
      flash[:success] = t("tags.new.success")
      redirect_to tags_path
    else 
      flash[:danger] = t("tags.shared.fail")
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = t("tags.edit.success")
      redirect_to tags_path
    else
      flash[:danger] = t("tags.shared.fail")
      redirect_to tags_path
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = t("tags.destroy.success")
    else
      flash[:danger] = t("tags.shared.fail")
    end
    redirect_to tags_url
  end

  private

    def tag_params
      params.require(:tag).permit(:tag_name)
    end
end