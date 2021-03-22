# frozen_string_literal: true

module AccesstypeRazorpayDemo
  class Onetime
    attr_accessor :api_key, :secret_key, :enviroment

    def initialize(**args)
      @api_key = args[:api_key]
      @secret_key = args[:secret_key]
      @enviroment = args[:enviroment]
    end

    def print_hello_world
      return "Hello World new !! #{api_key} and #{secret_key}"
    end

    def preview(*)
      nil
    end

    def after_charge(payment_token:)
      razorpay_payment = Api.get_payment(credentials, payment_token)
    end

    def capture(payment_token:, payment_amount: )
       razorpay_payment = Api.capture_payment(credentials,
                                              payment_token,
                                              payment_amount)

    end

    def credentials
      {api_key: api_key, secret_key: secret_key, enviroment: enviroment}
    end
  end
end