require "html2text"

module ActionMailer
  module Html2Text
    TEXT_PLAIN = "text/plain"
    TEXT_HTML = "text/html"

    def collect_responses(headers)
      add_plain_text(super(headers))
    end

    def add_plain_text(responses)
      html_part = responses.detect { |response| response[:content_type] == TEXT_HTML }
      text_part = responses.detect { |response| response[:content_type] == TEXT_PLAIN }

      if html_part && !text_part
        responses.insert 0, {
          content_type: TEXT_PLAIN,
          body: ::Html2Text.convert(html_part[:body])
        }
      end

      responses
    end
  end
end
