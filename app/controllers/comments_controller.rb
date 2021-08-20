class CommentsController < ApplicationController
  def new
    @review = Review.all.find(params[:review_id])
    @comment = @review.comments.new(parent_id: params[:parent_id])
  end
  
  def create
    @review = Review.all.find(params[:review_id])
    @comment = @review.comments.create(user_id: current_user.id, 
                                       cmt_content: comment_params[:cmt_content], 
                                       parent_id: comment_params[:parent_id])
    if @comment.save
      redirect_to review_path(@review.id)
    else
      flash[:danger] = t("review.show.fail")
      redirect_to review_path(@review.id)
    end
  end

  def comment_params
    params.require(:comment).permit(:parent_id,:cmt_content,:parent_id)
  end
end