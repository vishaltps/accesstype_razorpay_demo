# AccesstypeRazorpayDemo

This gem is wrapper for razorpay payment gateway. It is used to call different APIs of razorpay.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'accesstype_razorpay_demo'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install accesstype_razorpay_demo

## Usage


For one time payment
```
onetime_payment = AccesstypeRazorpayDemo::Onetime.new(api_key: "API_KEY_OF_RAZORPAY_ACCOUNT", secret_key: "SECRET_KEY_OF_RAZORPAY_ACCOUNT", enviroment: 'sandbox')
```

enviroment can be `live` or `sandbox`. By default it will take `live` as enviroment.

After initialization of onetime payment, you can use different methods. For instance, `after_charge`, `capture` etc.

Methods for one time payment

```
onetime_payment.after_charge(payment_token: "PAYMENT_TOKEN_OF_RAZORPAY")

onetime_payment.capture(payment_token: "PAYMENT_TOKEN", payment_amount: "PAYMENT_AMOUNT", payment_currency: "PAYMENT_CURRENCY")
```


For recurring payment

recurring_payment = AccesstypeRazorpayDemo::Recurring.new(api_key: "API_KEY_OF_RAZORPAY_ACCOUNT", secret_key: "SECRET_KEY_OF_RAZORPAY_ACCOUNT", enviroment: 'sandbox')

Methods for recurring payment

```
recurring_payment.preview(plan_id: "plan_id_OF_RAZORPAY", start_time: "START_TIME", duration: "DURATION", duration_unit: "DURATION_UNIT")

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/accesstype_razorpay_demo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/accesstype_razorpay_demo/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AccesstypeRazorpayDemo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/accesstype_razorpay_demo/blob/master/CODE_OF_CONDUCT.md).
