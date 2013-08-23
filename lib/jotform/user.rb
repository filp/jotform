require "jotform/lazy_list"
require "jotform/report"
require "time"

module JotForm
  class User < APIMethod
    # @return [LazyList]
    def reports
      @reports ||= LazyList.new(get("user/reports"), Report)
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
    # @return [Hash]
    def usage
      @usage ||= get "user/usage"
    end

    def active?
      self.details["status"] == "ACTIVE"
    end
  end
end