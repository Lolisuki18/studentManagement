require "test_helper"

class StudentMailerTest < ActionMailer::TestCase
  test "in_course" do
    mail = StudentMailer.in_course
    assert_equal "In course", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
