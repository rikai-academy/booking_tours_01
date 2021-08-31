require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  test "booking_tour" do
    mail = AdminMailer.booking_tour
    assert_equal "Booking tour", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "pay_success" do
    mail = AdminMailer.pay_success
    assert_equal "Pay success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "revenues_per_day" do
    mail = AdminMailer.revenues_per_day
    assert_equal "Revenues per day", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "statistics_at_the_end_of_month" do
    mail = AdminMailer.statistics_at_the_end_of_month
    assert_equal "Revenues per day", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
