# frozen_string_literal: true

module AccesstypeRazorpayDemo
	class Client
		attr_reader :config, :credentials

    def initialize(config, credentials)
      @config = config
      @credentials = credentials
    end

		def create_subscription(subscription_plan, subscriber, start_time, trial_period_duration = nil)
      razorpay_plan_id = subscription_plan.metadata.dig('razorpay', 'plan_id')
      total_count = calculate_subscription_total_count(subscription_plan)
      params = { plan_id: razorpay_plan_id, total_count: total_count, start_at: (Time.now + 1.hour) }

      # if subscriber.present?
      #   start_time = subscriber.most_suitable_start_timestamp(subscription_plan)
      #   start_time += trial_period_duration if trial_period_duration
      #   params[:start_at] = start_time.to_i if start_time > Time.zone.now
      # end
      response = client.post('/v1/subscriptions', params)
      if response.code == 200
        binding.pry
        # subscription = Razorpay::Subscription.new(response.parsed_response, config, credentials)
        # subscription
      else
        error_logger(system: 'RAZORPAY', message: "Recieved #{response.code} while creating recurring subscription #{credentials['app_key']}:#{params[:plan_id]}")
        nil
      end
    end

    private

    MAXIMUM_RENEWALS = {
      'weeks' => 520,
      'months' => 120,
      'years' => 10
    }.freeze

    def calculate_subscription_total_count(plan)
      [(10.years / plan.duration).to_i, MAXIMUM_RENEWALS[plan.duration_unit]].min
    end

    def client
      @client ||= ApiClient.new(config, credentials)
    end
	end
end