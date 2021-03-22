# frozen_string_literal: true

module AccesstypeRazorpayDemo
	class Api
		class << self
			def create_subscription(credentials, plan, subscriber, start_time, trial_period_duration)
				Client.new(AccesstypeRazorpayDemo::RAZORPAY_CONFIG.dig(0, credentials[:enviroment].to_sym), credentials).create_subscription(plan, subscriber, start_time, trial_period_duration)
			end

			def get_payment(credentials, payment_id)
				Client.new(AccesstypeRazorpayDemo::RAZORPAY_CONFIG.dig(0, credentials[:enviroment].to_sym), credentials).get_payment(payment_id)
			end

			def capture_payment(credentials, payment_id, payment_amount, payment_currency)
				Client.new(AccesstypeRazorpayDemo::RAZORPAY_CONFIG.dig(0, credentials[:enviroment].to_sym), credentials).capture_payment(payment_id, payment_amount, payment_currency)
			end
		end
	end
end