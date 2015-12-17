require "spec_helper"
require_relative "test_mailer"

describe ActionMailer::Html2Text do
  let(:mailer) { Class.new(TestMailer) }
  let(:mail) { mailer.test_email("test@example.com") }

  context "by default" do
    it "is not a multipart email" do
      expect(mail).to_not be_multipart
    end
  end

  context "when defining our own multipart templates" do
    let(:mailer) do
      Class.new(TestMailer) do
        def template_name
          "multipart_email"
        end
      end
    end

    it "is a multipart email" do
      expect(mail).to be_multipart
    end

    it "has two parts" do
      expect(mail.parts.size).to eq(2)
    end

    it "has text first" do
      expect(mail.parts.first.content_type).to match("text/plain")
    end

    it "has html second" do
      expect(mail.parts.second.content_type).to match("text/html")
    end
  end
end
