class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_comment, only: [:check, :destroy]
  before_action :pull_comment, only: [:new, :create]
  before_action :admin_user, only: :check

  def new
    @comment = @review.comments.new(parent_id: params[:parent_id])
  end
  
  def create
    @comment = @review.comments.create(comment_params)
    redirect_to review_path(@comment.review_id)
  end

  def check
    if @comment.appear?
      @comment.update_attribute(:status, "hide")
    else
      @comment.update_attribute(:status, "appear")
    end
    redirect_to review_path(@comment.review_id)
  end

  def destroy
    if @comment.destroy
      flash[:success] = t("categories.destroy.success")
    else
      flash[:danger] = t("categories.shared.fail")
    end
    redirect_to review_path(@comment.review_id)
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :parent_id, :cmt_content)
    end

    def load_comment
      @comment = Comment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("reviews.shared.fail")
        redirect_to reviews_path
    end

    def pull_comment
      @review = Review.all.find(params[:review_id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("reviews.shared.fail")
      redirect_to reviews_path
    end
end