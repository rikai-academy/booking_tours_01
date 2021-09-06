class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform notification
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", counter: render_counter(notification.recipient.notifications.count), layout: render_notification(notification)
  end

  private

    def render_counter counter
      ApplicationController.renderer.render(partial: "notifications/counter", locals: {counter: counter})
    end

    def render_notification notification
      ApplicationController.renderer.render(partial: "notifications/notification", locals: {notification: notification})
    end
end