class TestMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def template_name
    "test_email"
  end

  def test_email(to)
    @to = to

    mail({
      to: to,
      subject: "Test email",
      template_path: "templates",
      template_name: template_name
    })
  end
end
