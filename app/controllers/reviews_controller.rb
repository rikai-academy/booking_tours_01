class ReviewsController < ApplicationController
  before_action :logged_in_user
  before_action :set_category, only:[:edit,:new]
  before_action :load_review, only: [:edit, :update, :destroy]

  def index
    if current_user.admin?
      @reviews = Review.paginate(page: params[:page])
    else
      @reviews = Review.filter(current_user.id).paginate(page: params[:page])
    end
  end

  def new
    @review = Review.new
  end
  def show
    @review = Review.all.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("review.review.fail")
      redirect_to reviews_path
  end

  def create
    @review =current_user.reviews.create(review_params)
    if @review.save
      flash[:success] = t("review.review.new")
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:success] = t("review.review.updated")
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t("review.review.deleted")
    else
      flash[:danger] = t("review.review.fail")
    end
    redirect_to reviews_url
  end

  def like
    begin
      @review=Review.all.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("review.review.fail")
        redirect_to review_path(@review)
    end
    if @review.liked? current_user
      user_dislike
    else
      user_like
    end
    redirect_to review_path(@review)
  end
  
  private
    def review_params
      params.require(:review).permit(:review_name, :review_content, :category_id)
    end

    def load_review
      @review = current_user.reviews.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("review.review.fail")
        redirect_to reviews_path
    end

    def user_dislike
      LikeReview.find_by(review_id: params[:id], user_id: current_user.id).destroy!
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("review.review.fail")
    end

    def user_like
      LikeReview.create(review_id:@review.id, user_id:current_user.id)
    end
    
    def set_category
      @categories = Category.all
    end
end