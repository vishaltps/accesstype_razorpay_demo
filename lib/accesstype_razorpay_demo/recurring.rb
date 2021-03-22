# frozen_string_literal: true

module AccesstypeRazorpayDemo
  class Recurring
    attr_accessor :api_key, :secret_key, :enviroment

    def initialize(**args)
      @api_key = args[:api_key]
      @secret_key = args[:secret_key]
      @enviroment = args[:enviroment]
    end

    def preview(plan_id:, start_time:, opts: {})
      subscription = Api.create_subscription(
          credentials,
          plan_id,
          start_time,
          opts
        )

    	unless subscription
      	AccesstypeRazorpayDemo::Response.new(success: false, code: subscription&.code, message: subscription&.message)
      else
				AccesstypeRazorpayDemo::Response.new(success: true, code: 200, message: 'Subscritpion created successfully', data: subscription&.data)
			end
    end

    def credentials
    	{api_key: api_key, secret_key: secret_key, enviroment: enviroment}
    end
  end
end