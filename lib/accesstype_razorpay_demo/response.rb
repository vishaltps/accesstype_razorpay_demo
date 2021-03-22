module AccesstypeRazorpayDemo
  class Response
    attr_accessor :success, :code, :status, :message, :data

    def initialize(success: true, code: 200, status: , message: '', data:)
      @success = success
      @code = code
      @status = status
      @message = message
      @data = data
    end

    def success?
      success
    end
  end
end