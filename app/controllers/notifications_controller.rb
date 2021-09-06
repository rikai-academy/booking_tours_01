class NotificationsController < ApplicationController
  before_action :logged_in_user
  before_action :load_notification, only: :read

  def read    
    if @notification.unread?
      @notification.update_attribute(:status, "watched")
    end
    redirect_to review_path(@notification.notifiable)
  end

  private
    # Find a tour
    def load_notification
      @notification = Notification.all.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:danger] = t("notice.fail")
        redirect_to root_url
    end
end
