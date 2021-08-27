class PaySuccessJob < ApplicationJob
  queue_as :default

  def perform(args)
    UserMailer.pay_success(args[:current_user], args[:booking]).deliver_now
  end
end