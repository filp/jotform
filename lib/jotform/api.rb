require "jotform/api_method"
require "jotform/user"
require "net/http"
require "uri"
require "json"

module JotForm
  class API
    ENDPOINT = "http://api.jotform.com"
    VERSION  = "v1"

    # @return [String]
    attr_reader :api_key

    # @return [Integer]
    attr_reader :limit_left

    # @param [String] api_key
    def initialize(api_key)
      @api_key    = api_key
    end

    # Are there any requests available, or have we
    # passed the available limit?
    def within_limit?
      @limit_left > 0
    end

    # Performs a manual request to the API
    # 
    #   api.request("user", method: :get)
    #     #=> { "username": ..., "name":, ... }
    # 
    # @param  [String] ns
    # @param  [Hash]   options
    # @return [Hash]
    def request(ns, options = {params: {}, method: :get})
      uri = to_full_uri(ns)

      response = case options[:method]
      when :get
        Net::HTTP.get_response(uri)
      when :post
        Net::HTTP.post_form(uri, options[:params])
      else
        raise ArgumentError, "Unexpected method type #{options[:method].to_s}"
      end

      json = JSON.parse(response.body)
      
      if json["responseCode"] != 200
        raise APIError, "Unexpected API Response: #{json['message']}"
      end

      @limit_left = json["limit-left"]

      # return only the content hash:
      json["content"]
    end

    # @return [JotForm::User]
    def user
      @user ||= User.new.use_api(self)
    end

    def form(id)
    end

    def submission(id)
    end

    def report(id)
      Report.new(id)
    end

    def folder(id)
    end

  private
    # From a relative path and an API key, builds a full uri
    # 
    #   JotForm.to_full_uri("foo/bar")
    #     # => "http://api.jotform.com/v1/foo/bar?apiKey=banana"
    # 
    # @private
    # 
    # @return [URI]
    def to_full_uri(path)
      URI.parse([ENDPOINT, VERSION, path].join("/") << "?apiKey=#{@api_key}")
    end
  end
end