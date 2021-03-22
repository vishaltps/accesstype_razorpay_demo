module AccessTypeRazorpayDemo
	class ApiClient
		attr_reader :config, :credentials

		def initialize(config, credentials)
			@config = config.with_indifferent_access
			@credentials = credentials.with_indifferent_access
		end

		def get(path)
			response = HTTParty.get(
				config['root_url'] + path,
				basic_auth: { username: credentials['api_key'], password: credentials['secret_key'] }
				)
			return response unless response.code >= 500

			raise BadGatewayError.new(gateway: 'razorpay', path: path, response_code: response.code, response_body: response.parsed_response)
		end

		def post(path, options)
			response = HTTParty.post(
				config['root_url'] + path,
				body: options,
				basic_auth: { username: credentials['api_key'], password: credentials['secret_key'] }
				)

			return response unless response.code >= 500

			raise BadGatewayError.new(gateway: 'razorpay', path: path, response_code: response.code, response_body: response.parsed_response)
		end
	end
end

