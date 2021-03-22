# frozen_string_literal: true

module AccesstypeRazorpayDemo
	class Client
		attr_reader :config, :credentials

		def initialize(config, credentials)
			@config = config
			@credentials = credentials
		end

		def create_subscription(plan_id, start_time, opts)
			return AccesstypeRazorpayDemo::Response.new(success: false, code: response.code, message: "Duration or duration unit are not specified") if opts.dig(:duration).blank? || opts.dig(:duration_unit).blank?

			total_count = calculate_subscription_total_count(opts.dig(:duration), opts.dig(:duration_unit))
			params = { plan_id: plan_id, total_count: total_count, start_at: (Time.now + 1.hour) }

			response = client.post('/v1/subscriptions', params)
			if response.code == 200
				AccesstypeRazorpayDemo::Response.new(success: false, code: response.code, message: "Recieved #{response.code} while creating recurring subscription", data: response.parsed_response)
			else
				AccesstypeRazorpayDemo::Response.new(success: false, code: response.code, message: "Recieved #{response.code} while creating recurring subscription")
			end
		end

		def get_payment(payment_id)
			response = client.get("/v1/payments/#{payment_id}")

			if response.code == 200
				AccesstypeRazorpayDemo::Response.new(success: true, code: 200, message: "Fetched payment successfully", data: response.parsed_response)
			else
				AccesstypeRazorpayDemo::Response.new(success: false, code: response.code, message: "Recieved #{response.code} while fetching payment #{credentials['app_key']}:#{payment_id}")
			end
		end

		def capture_payment(payment_id, payment_amount, currency)
			response = client.post(
				"/v1/payments/#{payment_id}/capture",
				amount: payment_amount,
				currency: currency
				)
			if response.code == 200
				AccesstypeRazorpayDemo::Response.new(success: true, code: 200, message: "Payment captured successfully", data: response.parsed_response)
			else
				AccesstypeRazorpayDemo::Response.new(success: false, code: response.code, message: "Recieved #{response.code} while capturing payment #{credentials['app_key']}:#{payment_id}")
			end
		end

		private

		MAXIMUM_RENEWALS = {
			'weeks' => 520,
			'months' => 120,
			'years' => 10
		}.freeze

		def calculate_subscription_total_count(duration, duration_unit)
			# [(10.years / duration).to_i, MAXIMUM_RENEWALS[duration_unit]].min # was getting error from rails TypeError: no implicit conversion of String into ActiveSupport::Duration
			120 # added just for testing
		end

		def client
			@client ||= ApiClient.new(config, credentials)
		end
	end
end 