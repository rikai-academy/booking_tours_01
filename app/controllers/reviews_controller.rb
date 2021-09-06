class ReviewsController < ApplicationController
  before_action :logged_in_user, except: :show
  before_action :set_category, only: [:edit, :new, :create, :update]
  before_action :load_review, only: [:edit, :update, :destroy]
  before_action :pull_review, only: [:show, :like, :check, :report]
  before_action :admin_user, only: [:check]

  def index
    if current_user.admin?
      reviews = Review.search(params[:term])
    else
      reviews = Review.search(params[:term]).where(user_id: current_user.id)
    end

    if (params[:page].blank?)
      @reviews = reviews.page(Settings.Paginate.default_page)
    else
      @reviews = reviews.page(params[:page])
    end
  end

  def new
    @review = Review.new
  end

  def show
    @author= @review.user
  end

  def create
    @review = current_user.reviews.create(review_params)    
    if @review.save
      flash[:success] = t("reviews.new.success")
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:success] = t("reviews.edit.updated")
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t("reviews.destroy.deleted")
    else
      flash[:danger] = t("reviews.shared.fail")
    end
    redirect_to reviews_url
  end

  def like
    if @review.liked? current_user
      user_dislike
    else
      user_like
    end
    redirect_to review_path(@review)
  end

  def check
    if @review.appear?
      @review.update_attribute(:status, "hide")
    else
      @review.update_attribute(:status, "appear")
    end
    redirect_to reviews_path
  end

  def report
    Notification.create(user_id: current_user.id,
      notifiable: @review,
      action: "reported_rw",
      recipient_id: User.first.id)
    flash[:success] = t("notice.success")
    redirect_to review_path(@review)
  end
  
  private
  
    def review_params
      params.require(:review).permit(:review_name, :review_content, :image, :category_id)
    end

    def load_review
      if (current_user.admin?)
        @review = Review.all.find(params[:id])
      else
        begin
          @review = current_user.reviews.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            flash[:danger] = t("reviews.shared.fail")
            redirect_to reviews_path
        end
      end
    end

    def pull_review
      @review=Review.all.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = t("reviews.shared.fail")
      redirect_to root_url
    end

    def user_dislike
      LikeReview.find_by(review_id: params[:id], user_id: current_user.id).destroy!
      Notification.find_by(user_id: current_user.id,
                           action: "liked",
                           recipient_id: @review.user_id).destroy!
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("reviews.shared.fail")
    end

    def user_like
      LikeReview.create(review_id: @review.id, user_id: current_user.id)
      Notification.create(user_id: current_user.id,
                          notifiable: @review,
                          action: "liked",
                          recipient_id: @review.user_id)
    end
end