module JotForm
  class APIMethod
    attr_reader :api

    # @param [Hash]
    def initialize(data = nil)
      @data = data
    end

    # @return [Hash, nil]
    def all
      @data
    end

    # Returns the full hash of details for the active user.
    # @return [Hash, nil]
    alias_method :details, :all

    # Sets up this method to use the given API wrapper
    # 
    # @param [JotForm::APIMethod]
    def using_api(api)
      @api = api
      self
    end

    # @return [Time]
    def created_at
      Time.parse(self.all["created_at"]) if self.all["created_at"]
    end

    # @return [Time]
    def updated_at
      Time.parse(self.all["updated_at"]) if self.all["updated_at"]
    end

    # to-do: fix-up the camel-case/snake_case inconsistencies
    # for less ugly code.
    def method_missing(key, *args, &block)
      unless @data[key]
        raise ArgumentError, "Unknown property #{key} for #{self.class}"
      end

      @data[key]
    end
  protected
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