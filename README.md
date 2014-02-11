# Capistrano3 Email Notifier

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano_notifier'

And then execute:

    $ bundle

## Usage

In your ```deploy/config.rb```:

```ruby
set :notifier_mail_options, { to: "notify@example.com",
                              from: "deploy@example.com",
                              delivery_method: :smtp}
```

In your ```Capfile```:

```ruby
require 'capistrano/notifier'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
