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
      subscription = Api.create_subscription(
          credentials,
          subscription_plan,
          subscriber,
          start_time,
          opts.dig(:trial_period_duration)
        )

    	unless subscription
      	AccesstypeRazorpayDemo::Response.new(success: false, code: subscription&.code, message: 'Remote Subscritpion could not be created')
      else
				AccesstypeRazorpayDemo::Response.new(success: true, code: subscription&.code, message: 'Subscritpion created successfully', data: subscription)
			end
    end

    def credentials
    	{api_key: api_key, secret_key: secret_key, enviroment: enviroment}
    end
  end
end