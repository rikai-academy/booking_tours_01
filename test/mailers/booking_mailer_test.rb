require "test_helper"

class BookingMailerTest < ActionMailer::TestCase
  test "booking_tour" do
    mail = BookingMailer.booking_tour
    assert_equal "Booking tour", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "pay_success" do
    mail = BookingMailer.pay_success
    assert_equal "Pay success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
