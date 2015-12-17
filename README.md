actionmailer-html2text [![Build Status](https://travis-ci.org/soundasleep/actionmailer-html2text.svg?branch=master)](https://travis-ci.org/soundasleep/actionmailer-html2text)
======================

`actionmailer-html2text` automatically adds plain text parts to HTML emails sent by ActionMailer, using [html2text](https://github.com/soundasleep/html2text_ruby).

## Installing

Add into your Gemfile:

```ruby
gem 'actionmailer-html2text'
```

Run `bundle install`. Now, either add automatic text parts to a single mailer:

```ruby
class WelcomeMailer < ApplicationMailer
  include ActionMailer::Html2Text                # Add this include

  def welcome_email(to)
    mail(to: to, subject: "Subject")
  end
end
```

Or you can add it to _all_ of your mailers:

```ruby
class ApplicationMailer < ActionMailer::Base
  include ActionMailer::Html2Text                # Add this include

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
