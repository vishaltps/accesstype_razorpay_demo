# frozen_string_literal: true

module AccesstypeRazorpayDemo
  class Recurring
    attr_accessor :api_key, :secret_key, :enviroment

    def initialize(**args)
      @api_key = args[:api_key]
      @secret_key = args[:secret_key]
      @enviroment = args[:enviroment]
    end

    def preview(subscription_plan:, subscriber:, start_time:, opts:)
      razorpay_subscription = RazorpayApi.create_subscription(
          credentials,
          subscription_plan,
          subscriber,
          start_time,
          opts.dig(:trial_period_duration)
        )

        return PaymentResult.error('razorpay_recurring', message: 'Remote Subscritpion could not be created') unless razorpay_subscription

        subscription_attempt = params[:subscription_attempt]
        subscription_attempt&.update(external_reference_id: razorpay_subscription.id)
        nil
    end

    def credentials
    	{api_key: api_key, secret_key: secret_key, enviroment: enviroment}
    end
  end
end