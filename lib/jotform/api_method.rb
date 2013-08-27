module JotForm
  class APIMethod
    attr_reader :api

    class << self
      # Usage:
      # 
      #   class Form < APIMethod
      #     has :title
      #     has :align
      #     
      #     # ...
      #   end
      # 
      #   Form.new.title #=> ...
      # 
      def has(property, options={})
        define_method property do
          @data[property.to_s]
        end

        alias_method options[:alias], property if options[:alias]
      end
    end

    # @param [Hash]
    def initialize(data = nil)
      @data = data
    end

    # @return [Hash, nil]
    def all
      @data
    end

    # Sets up this method to use the given API wrapper
    # 
    # @param [JotForm::APIMethod]
    def use_api(api)
      @api = api
      self
    end

    # @return [Time]
    def created_at
      Time.parse(all["created_at"]) if all["created_at"]
    end

    # @return [Time]
    def updated_at
      Time.parse(all["updated_at"]) if all["updated_at"]
    end

    # the jotform API has a couple different formats for status, this
    # method + alias combines them into a more consistent interface.
    def enabled?
      all["status"] && ["ACTIVE", "ENABLED"].include?(all["status"])
    end
    alias_method :active?, :enabled?

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