class Notification < ApplicationRecord
  enum status: { unread: false, watched: true}
  belongs_to :user
  belongs_to :recipient, class_name: :User
  belongs_to :notifiable, polymorphic: true

  after_create :send_notification

  def send_notification
    NotificationRelayJob.perform_now(self)
  end
end
