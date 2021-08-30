require "test_helper"

class TourMailerTest < ActionMailer::TestCase
  test "new_tour" do
    mail = TourMailer.new_tour
    assert_equal "New tour", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
