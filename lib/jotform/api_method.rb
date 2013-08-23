module JotForm
  class APIMethod
    attr_reader :api

    # Sets up this method to use the given API wrapper
    # 
    # @param [JotForm::APIMethod]
    def using_api(api)
      @api = api
      self
    end

    # Shortcut for performing a GET request
    # 
    # @param  [String] ns
    # 
    # @return [Hash]
    def get(ns)
      @api.request(ns, method: :get)
    end

    # Shortcut for performing a POST request
    # 
    # @param [String] ns
    # @param [Hash]   params
    # 
    # @return [Hash]
    def post(ns, params)
      @api.request(ns, method: :post, params: params)
    end
  end
end