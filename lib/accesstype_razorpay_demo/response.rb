module AccesstypeRazorpayDemo
  class Response
    attr_accessor :success, :code, :status, :message, :data

    def initialize(success: true, code: 200, message: '', data: {})
      @success = success
      @code = code
      @message = message
      @data = data
    end
  end
end