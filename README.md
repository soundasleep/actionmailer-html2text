actionmailer-html2text [![Build Status](https://travis-ci.org/soundasleep/actionmailer-html2text.svg?branch=master)](https://travis-ci.org/soundasleep/actionmailer-html2text)
======================

`actionmailer-html2text` automatically adds plain text parts to HTML emails sent by ActionMailer, using [html2text](https://github.com/soundasleep/html2text_ruby).

For example:

```html
<html>
<title>Ignored Title</title>
<body>
  <h1>Hello, World!</h1>

  <p>This is some e-mail content.
  Even though it has whitespace and newlines, the e-mail converter
  will handle it correctly.

  <p>Even mismatched tags.</p>

  <div>A div</div>
  <div>Another div</div>
  <div>A div<div>within a div</div></div>

  <a href="http://foo.com">A link</a>

</body>
</html>
```

Will be converted into:

```text
Hello, World!

This is some e-mail content. Even though it has whitespace and newlines, the e-mail converter will handle it correctly.

Even mismatched tags.
A div
Another div
A div
within a div
[A link](http://foo.com)
```

## Notes

1. Any existing `text/plain` parts will not be overwritten, so you can still create custom text parts with `template.text.erb` and `template.html.erb`

1. Any HTML email emails processed will become multipart in order to add the `text/plain` part.

1. [Issues](https://github.com/soundasleep/actionmailer-html2text/issues) and [pull requests](https://github.com/soundasleep/actionmailer-html2text/pulls) welcome!

## Installing

Add [the gem](https://rubygems.org/gems/actionmailer-html2text) into your Gemfile and run `bundle install`:

```ruby
gem 'actionmailer-html2text'
```

You can now enable automatic text parts on just a single mailer:

```ruby
class WelcomeMailer < ApplicationMailer
  include ActionMailer::Html2Text                # Just add this

  def welcome_email(to)
    mail(to: to, subject: "Subject")
  end
end
```

Or you can add it to _all_ of your mailers:

```ruby
class ApplicationMailer < ActionMailer::Base
  include ActionMailer::Html2Text                # Just add this

  default from: "from@example.com"
  layout 'mailer'
end
```

## Tests

```
bundle install
rspec
```

## License

`actionmailer-html2text` is licensed under MIT.
