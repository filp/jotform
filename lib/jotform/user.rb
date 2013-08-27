require "jotform/report"
require "ostruct"
require "time"

module JotForm
  class User < APIMethod
    # @return [Array]
    def reports
      @reports ||= get("user/reports").map { |data| Report.new(data) }
    end

    # Returns full usage details for the active user
    # 
    #   user.usage
    #     # => {
    #        "submissions": "0",
    #        "ssl_submissions": "0",
    #        "payments": "0",
    #        "uploads": "0"
    #       }
    # 
    # @return [OpenStruct]
    def usage
      @usage ||= OpenStruct.new(get("user/usage"))
    end

    # decorate #all to load user data on-demand
    def all 
      @data ||= get("user")
      super
    end
  end
end