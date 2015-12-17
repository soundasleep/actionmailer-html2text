require "spec_helper"
require_relative "test_mailer"

describe ActionMailer::Html2Text do
  let(:mailer) { Class.new(TestMailer) }

  let(:to_address) { "test@example.com" }
  let(:mail) { mailer.test_email(to_address) }
  let(:text) { mail.parts.first.body }

  context "by default" do
    it "is not a multipart email" do
      expect(mail).to_not be_multipart
      expect(mail.parts).to be_empty
    end
  end

  context "when including our html2text module" do
    let(:mailer) do
      Class.new(TestMailer) do
        include ActionMailer::Html2Text
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

    context "the text part" do
      it "does not have any HTML" do
        expect(text).to_not include("<")
      end

      it "includes a markdown-style link" do
        expect(text).to include("[your website](http://example.com)")
      end

      it "includes the to: address" do
        expect(text).to include(to_address)
      end
    end
  end

  context "when defining our own multipart templates without Html2Text" do
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

    context "the text part" do
      it "does not have any HTML" do
        expect(text).to_not include("<")
      end

      it "includes a markdown-style link" do
        expect(text).to include("[your website](http://example.com)")
      end

      it "includes the to: address" do
        expect(text).to include(to_address)
      end
    end
  end
end
